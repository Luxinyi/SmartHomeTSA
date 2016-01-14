function [pacf] = getPACF(s, lagMax, lagUnit)
% 
% function [pacf] = getPACF(s, lagMax, lagUnit)
% 
% calculate the partial autocorrelation function of the given signal s
% 
% Input: 
% s: original signal
% lagMax: number of lags
% lagUnit: size of lag/ length of time step
%
% Output:  
% pacf: partial autocorrelation function 
%

L    = length(s);
pacf = zeros(lagMax, 1);
T = zeros(L, lagMax);
for i = 1:lagMax
    T(:, i) = backshift(s, i*lagUnit);
end

for i = 1:lagMax
    b = regress(s, T(:, 1:i));
    pacf(i) = b(i);
end

end

% programmer: Lucy Lu
% 
% initial draft: 10/2015
% revision history 
%
