function [Fraw,PfSen_v_norm,ListPar] = call_TEDS(Opts,RandV,yExLevel,caseNo)

isNorm = 1;

% -------------------------------------------------------------------------
% generate random samples 

    [ListPar,parJ] = parList(Opts,RandV,isNorm);
    [nPar, ~] = size(ListPar);                                  % get size
    nS = Opts.nSampMC;                                          % No. of samples
    [xS,ListPar,ParSen] = parSampling (ListPar, nPar,nS);    

% -------------------------------------------------------------------------
% with the generated random samples, evaluate the blackbox function h 

     disp('Monte Carlo Analysis Starts: ...')
     tic;  
     
        h_Results = cal_h (xS, Opts);
        y = h_Results.y;    
        
     elapseTime = floor(toc*100)/100; 
     disp(strcat('Analysis Completed: ',num2str(elapseTime),'[s]'))   

% -------------------------------------------------------------------------
% with y, post process for FIM 
% first estimate the pdf of y and then form F matrix     

    % in case 3, use normalised response
    if caseNo == 3
        y(:,1) = y(:,1)/max(y(:,1));
        y(:,2) = y(:,2)/max(y(:,2)); 
    end

     disp('Estimating Fisher: ...')
     tic;   
     
         yjpdf = cal_jpdf_hist (y,xS,Opts.Ny);

         % compute fisher matrix (raw)
         Fraw = cal_jFisher (yjpdf,nPar);
         Fraw = Fraw(1:nPar*2,1:nPar*2);  % 3rd/4th parameters are not implemented     

     elapseTime = floor(toc*100)/100; 
     disp(strcat('Fisher EigenAnalysis Completed: ',num2str(elapseTime),'[s]'))

% -------------------------------------------------------------------------    
% compute failure probablity and its sensitivity
    
    % define the utility function 
    if caseNo == 1 || caseNo == 2
        U = y;   
    elseif caseNo == 3
        y1 = y(:,1);
        y2 = y(:,2);
        U = (y1).^2 + (y2).^2;
    end
    

    [Pf_ExDisp,PfMean_ExDisp,PfSen_ExDisp] = calPfyEx(U,Opts,yExLevel,nS,ParSen,Opts.mode);

        pF_Disp.pF = Pf_ExDisp;
        pF_Disp.pFm = PfMean_ExDisp;
        pF_Disp.pFs = PfSen_ExDisp;

    PfSen_v_norm = zeros(Opts.nThresholdFactor,1);
     for ii = 1 : Opts.nThresholdFactor   
         PfSen_v = cellfun(@(x) x(ii), PfSen_ExDisp); % put Pf sensitivity into vectors

         PfSen_v = PfSen_v (:) ; % put it into a single vector
         PfSen_v_norm (ii) = norm(PfSen_v); % take L2 norm of normalised vector 
     end

    