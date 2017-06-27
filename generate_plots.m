function generate_plots(FMin,FMax,FigName)

            sys = load(['./measured_TFs/sys.mat']);
            sys = sys.sys;
            
            FigName = char(FigName);
            
            [TF_resp,TF_W]  = frdata(sys,'v');
            TF_freq             = TF_W;
            
            if nargin == 0
                FMin = TF_freq(1);
                FMax = TF_freq(end);
            end
            
            TF_mag  = abs(TF_resp);
            TF_phs  = angle(TF_resp);
            
            
            color_val =   [0.8500  ,  0.3250 ,   0.0980];
            
            BO = bodeoptions;
            BO.PhaseWrapping = 'on';
            BO.FreqUnits = 'Hz';
            
            fig1 = figure(1);
            
            subplot(211)
            loglog(TF_freq,TF_mag,'color',color_val);
            grid('on');
            xlim([FMin FMax]);
            xlabel('Frequency (Hz)')
            ylabel('Mag')
            
            subplot(212)
            semilogx(TF_freq,wrapTo180(TF_phs*180/pi),'color',color_val);
            grid('on');
            xlim([FMin FMax]);
            xlabel('Frequency (Hz)')
            ylabel('Phase (deg)')
            
            saveas(fig1,sprintf('%s.png',FigName))
            
end