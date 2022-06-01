function [yExLevel,RandV,Opts] = call_case (caseNo)

switch caseNo

    case 1

        % -------------------------------------------------------------------------   
        % options 
            Opts.nSampMC  = 50000;  % number of MC samples 
            Opts.Ny       = 30;     % length y vector for cdf and pdf estimation 
            Opts.funName  ='design_dummy';
            Opts.distType ='Normal';  
        % -------------------------------------------------------------------------
        % input 
            RandV.nVar = 1;
            RandV.vNominal =  1 ; 
            RandV.CoV = 1/5 * ones(RandV.nVar,1);
        % -------------------------------------------------------------------------
        % failure thresholds (KPI)   
            Opts.nThresholdFactor = 100;  
            mu  = RandV.vNominal; 
            sigma = RandV.vNominal*RandV.CoV ;
            yExLevel = linspace(-3*sigma + mu,3*sigma + mu,Opts.nThresholdFactor); 
            Opts.mode = 2;
      
    case 2 

        % -------------------------------------------------------------------------   
        % options 
            Opts.nSampMC  = 10000;  % number of MC samples 
            Opts.Ny       = 50;     % length y vector for cdf and pdf estimation 
            Opts.funName  ='design_1dof';
            Opts.distType ='Normal';  
        % -------------------------------------------------------------------------
        % input 
            RandV.nVar = 2;
            RandV.vNominal =  [1 0.1].'; 
            RandV.CoV = 1/10 * ones(RandV.nVar,1);
        % -------------------------------------------------------------------------
        % failure thresholds (KPI)   
            Opts.nThresholdFactor = 100;  
            yExLevel = linspace(5,95,Opts.nThresholdFactor); 
            Opts.mode = 1;

    case 3

        % -------------------------------------------------------------------------   
        % options 
            Opts.nSampMC  = 5000;  % number of MC samples 
            Opts.Ny       = 50;     % length y vector for cdf and pdf estimation 
            Opts.funName  ='design_cb';
            Opts.distType ='Lognormal'; 
        % -------------------------------------------------------------------------
        % input 
            RandV.nVar = 2;
            RandV.vNominal = [69e9 2700].'; 
            RandV.CoV = [1/2 1/5].';
        % -------------------------------------------------------------------------
        % failure thresholds (KPI)   
            Opts.nThresholdFactor = 100;  
            yExLevel = linspace(5,95,Opts.nThresholdFactor); 
            Opts.mode = 1;    

end