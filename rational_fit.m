function rational_fit(NPoles,FMin,FMax)

            sys = load(['./measured_TFs/sys.mat']);
            sys = sys.sys;


    [TF_resp,TF_W]       = frdata(sys,'v');
    TF_freq              = TF_W/2/pi;
    TF_mag               = abs(TF_resp);
    TF_phs               = angle(TF_resp);
    
TF_TF= TF_mag.*exp(1i*TF_phs);
TF_TF_orig = TF_TF;

% Smooth TF if noisy 
TF_TF= smooth(TF_mag,'sgolay',3).*exp(1i*smooth(TF_phs,'sgolay',3));
sys_inp_smoothed  = frd(TF_TF,TF_W);



% Fit a rational function [Vector Fitting]
% https://in.mathworks.com/help/rf/ug/rationalfit.html
fit = rationalfit(TF_freq,TF_TF,'NPoles',NPoles,'Weight',1./abs(TF_TF));
customresp = freqresp(fit,TF_freq); 

[b,a] = residue(fit.C,fit.A,fit.D);
sys_mod = tf(real(b),a);
[z,p,k] = zpkdata(sys_mod,'v');

% Bode Plot options
 BO = bodeoptions;
 BO.PhaseWrapping = 'on';
 BO.FreqUnits = 'Hz';
 BO.Title.FontSize = 20;
 BO.XLabel.FontSize = 20;
 BO.YLabel.FontSize = 20;
 BO.TickLabel.FontSize = 20;
 BO.XLim = [1e-1 1e9];
 
 
% Plotting  
fig3  = figure(3); clf;
set(gcf,'Units','inches',...
 'Position',[1 1 10 8])
set(gcf,'color','w'); grid on


bode(sys,BO)
h1 = findobj(gcf,'type','line'); set(h1,'linewidth',2);
hold all
bode(sys_mod,BO)
h2 = findobj(gcf,'type','line'); set(h2,'linewidth',2);
legend('Measured','Fit','Location','SouthWest')
grid on

h1(1).Parent.XLim = [FMin, FMax];

end