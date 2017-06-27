function [coe] = quack3andahalf_modified(gomo,Fs,filename,varargin)


% Digital Filter Maker
% This function takes as arguments, gomo, a matlab 'sys' object
% and the sample frequency, Fs, at which to make coefs.
% Other arguments (e.g., pre-warp frequency) are passed to bilinear.
%
% It returns the digital filter coefficients in the order
% they go in the CDS standard filter modules.
% i.e. LSC FE, ASC FE, DSC, MSC, PEPI (someday)
%
% Example 1 (low pass):
% [z,p,k] = ellip(6,1,40,2*pi*35,'s');
% goo = zpk(z,p,k);
%
% quack3(goo,2048)
%
% Example 2 (notch):
%
% f_notch = 60;
% notch_Q = 30;
% hole = twint(f_notch,notch_Q);
% quack3(hole,2048,f_notch);
%
%
% if nargin == 3
%   f_prewarp = varargin{1};
% elseif nargin == 4
%   fname = varargin{2};
%   f_prewarp = varargin{1};
% end



% Getting the ZPK data
[z,p,k] = zpkdata(gomo,'v');

% Bilinear transform from s to z plane
[zd,pd,kd] = bilinear(z,p,k,Fs,varargin{:}); 

% SOSing the digital zpk

[sos,gs] = zp2sos(zd,pd,kd);

[g,ca] = sos_shuffle(sos);

coe = real([gs ca']);

% Define some helper functions:
    function format_txt(coe)
        %fprintf(1, '%134c%c\n', ' ', '#');
        fprintf(1, 'NAME # 21 1 0 0  LABEL   ');
        fprintf(1, '%20.12f', coe(1));
        fprintf(1, '%20.14f', coe(2:5));
        fprintf(1, '\n');
        for n = 6:4:length(coe)
            fprintf(1, '%24c %20c', ' ', ' ');
            fprintf(1, '%20.14f',coe(n:n+3));
            fprintf(1, '\n');
        end
    end

    function format_foton(coe)
        % produce formatted output for Foton
        fprintf(1, '\n');
        fprintf(1, '\n');
        fprintf(1, '\n'); 
        fprintf(1,'sos(%15.12f,   [ ', coe(1));
        fprintf(1,'%18.14f; ', coe(2:5));
        for n = 6:4:length(coe)
            fprintf(1, '\n');
            fprintf(1, '%25c', ' ');
            fprintf(1, '%18.14f; ',coe(n:n+3));
        end
        fprintf(1, ' ],"o")\n');
    end

%movefile(sprintf('%s.txt',char(filename)),'./junk');
diary(sprintf('%s.txt',char(filename)));
% Use them to produce formatted output:
n_blocks = ceil((length(coe)-1)/40); 
for block=1:n_blocks,
    first_index = (block - 1)*40 + 2;
    last_index = min(first_index + 39, length(coe));
    if block==1
        gain = coe(1);
    else
        gain = 1;
    end
%     format_txt([gain coe(first_index:last_index)]);
    format_foton([gain coe(first_index:last_index)]);
end
diary off

end % function quack3
