% Function to assign unit weight to certain set of frequencies
% Input: [X,Y]
% X = inp_freq vector
% Y = [FW(1) FW(2) FW(3) FW(4) .....]
function [Weight] = get_weight(X,Y)

Weight = zeros(size(X));

id = zeros(size(Y));
for i = 1:numel(Y)
    [~,id(i)] = (min(abs(X-Y(i))));
end

for i = 1:2:numel(Y)
    Weight(id(i):id(i+1)) = 1;
end

end



