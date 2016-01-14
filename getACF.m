function [acf] = getACF(s, lagMax, lagUnit)
% 
% function [acf] = getACF(s, lagMax, lagUnit)
% 
% calculate the autocorrelation function of the given signal s
% 
% Input: 
% s: original signal
% lagMax: number of lags
% lagUnit: size of lag/ length of time step
%
% Output:  
% acf: autocorrelation function 
%

for i = 1:length(s)
    if isnan(s(i)) == 1
        s(i) = s(i - 1);
    end
end

tsL  = length(s);
ts   = zeros(tsL+lagUnit*lagMax, 1); 
acf  = zeros(lagMax, 1);
mean = nanmean(s);
var  = nanvar(s);

s0 = s;
s0(isnan(s0)) = mean;
ts(lagUnit*lagMax+1:end) = s0; %% initialize zero-padded time series data


for i = 1:lagMax
    Y       = ts(end-lagUnit*i-tsL+1:end-lagUnit*i);
    acf(i) = (s0 - mean)'*(Y - mean)/(var*tsL);      
end

return 
     
% programmer: Lucy Lu
% 
% initial draft: 10/2015
% revision history 
%
