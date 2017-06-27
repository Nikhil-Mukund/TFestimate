% Generate TFestimate Readable files
coh = data.mcoh;
ff = (data.ff)/2/pi;
for j = 1:size(coh,2)
x = coh(:,j);
filename  = sprintf('./measured_TFs/junk%d.txt',j);
fid = fopen(filename,'w');
for i = 1:numel(x)
fwrite(fid,sprintf('%d %d %d \n',ff(i),real(x(i)),imag(x(i))));
end
end