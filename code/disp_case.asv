function figName = disp_case (Fraw,PfSen_v_norm,RandV,ListPar,Opts,yExLevel,caseNo)

    switch caseNo
    
        case 1
            mu  = RandV.vNominal; 
            sigma = RandV.vNominal*RandV.CoV ;
            [Pfnorm2,F2] = analyticalCase1 (sigma,mu,Opts.nThresholdFactor);
    
             fig1 = figure; 
             pl = semilogy (yExLevel,PfSen_v_norm.^2,'ko',...
                 yExLevel,repmat(trace(Fraw),Opts.nThresholdFactor,1),'ko',...
                 yExLevel,Pfnorm2,'k--',...
                 yExLevel,repmat(trace(F2),Opts.nThresholdFactor,1),'k--');
    
    
            annotation('textarrow',[0.7 0.8],[0.3 0.4],'String','$\Vert\frac{\partial P_f}{\partial \mathbf b}\Vert^2$ ','FontSize',20,'Interpreter','latex')
            annotation('textarrow',[0.3 0.4],[0.65 0.75],'String','tr$(\mathbf F)$','FontSize',20,'Interpreter','latex')
            
            set(pl([3 4]),'LineWidth',1.5)
        
            xlabel('$y$','Interpreter','latex')
            ylabel('Sensitivity Norm')
            title (strcat('$y = x$ $\sim \mathcal{N}$ (',num2str(mu),',',{' '},num2str(sigma),'$^2$)'),'Interpreter','latex')
        
            legend(pl([1 3]),'Numerical: MC-LR','Analytical')
            set(gca,'FontSize',16)
        
            ylim([1e-3 1e3])
            xlim([0.4 1.6])
        
        
            figName ='dummycase';
            figuresize(24, 18, 'centimeters');
            movegui(fig1, [50 40])
            set(gcf, 'Color', 'w');
          
        case 2 
    
             sigma_x = ListPar(:,6);
             s1 = sigma_x(1);
             s2 = sigma_x(2);
             Fx = diag([1/s1^2 2/s1^2 1/s2^2 2/s2^2]); % fisher of input
            
             fig1 = figure; 
             pl = semilogy (yExLevel,PfSen_v_norm.^2,'ko',...
                 yExLevel,repmat(trace(Fraw),Opts.nThresholdFactor,1),'k--',...
                 yExLevel,repmat(trace(Fx),Opts.nThresholdFactor,1),'k-');
            
            
                annotation('textarrow',[0.7 0.6],[0.2 0.3],'String','$\Vert\frac{\partial P_f}{\partial \mathbf b}\Vert^2$ ','FontSize',20,'Interpreter','latex')
                annotation('textarrow',[0.3 0.4],[0.4 0.55],'String','tr$(\mathbf {F_y})$','FontSize',20,'Interpreter','latex')
                annotation('textarrow',[0.25 0.35],[0.8 0.72],'String','tr$(\mathbf {F_x})$','FontSize',20,'Interpreter','latex')
            
                set(pl(2),'LineWidth',1.5)
            
                xlabel('Threshold $z^{th}$ percentile','Interpreter','latex')
                ylabel('Sensitivity Norm')
                title ('Simple Harmonic Oscillator')
            
                set(gca,'FontSize',16)
            
                ylim([1e1 1e6])
                      
                figName ='SHOcase';
                figuresize(24, 18, 'centimeters');
                movegui(fig1, [50 40])
                set(gcf, 'Color', 'w');
    
    
        case 3

             sigma_x = ListPar(:,6);
             s1 = sigma_x(1);
             s2 = sigma_x(2);
              Fx = diag([1/s1^2 2/s1^2 1/s2^2 2/s2^2]); % fisher of input
            
             fig1 = figure; 
             pl = semilogy (yExLevel,PfSen_v_norm.^2,'ko',...
                 yExLevel,repmat(trace(Fraw),Opts.nThresholdFactor,1),'k--',...
                 yExLevel,repmat(trace(Fx),Opts.nThresholdFactor,1),'k-');
            
            
                annotation('textarrow',[0.7 0.6],[0.25 0.37],'String','$\Vert\frac{\partial P_f}{\partial \mathbf b}\Vert^2$ ','FontSize',20,'Interpreter','latex')
                annotation('textarrow',[0.3 0.4],[0.5 0.6],'String','tr$(\mathbf {F_y})$','FontSize',20,'Interpreter','latex')
                annotation('textarrow',[0.25 0.35],[0.85 0.78],'String','tr$(\mathbf {F_x})$','FontSize',20,'Interpreter','latex')
            
                set(pl(2),'LineWidth',1.5)
            
                xlabel('Threshold $z^{th}$ percentile','Interpreter','latex')
                ylabel('Sensitivity Norm')
                title ('Cantilever Beam')
            
                set(gca,'FontSize',16)
            
                ylim([1e-2 1e3])
            
            
                figName ='cantilever';
                figuresize(24, 18, 'centimeters');
                movegui(fig1, [50 40])
                set(gcf, 'Color', 'w');
    
    
    
    end
end

function [Pfnorm2,F] = analyticalCase1 (sigma,mu,n)

% use this code to plot some example results for simple case of y=x for the
% probability sensitivity bound 
    
    x = linspace(-3*sigma + mu,3*sigma + mu,n); 
    
    px = normpdf(x,mu,sigma); % generate normal pdf 
    
    F = [1/sigma^2  0 ; 0 2/sigma^2];% fisher information matrix 
    
    Pfnorm2 = px.^2 .*(1 + ((x - mu)./sigma).^2); % norm square of the probablity sensitivity

end