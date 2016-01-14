function [yhat] = MAseasonal(y, lagUnit, theta, season)
% 
% function [yhat] = MAseasonal(y, lagUnit, phi, season)
% 
% fit seasonal MA model to the given signal
% 
% Input: 
% y: original signal
% lagUnit: size of lag/ length of time step
% theta: parameter of the seasonal term
% season: number of lags in a season
%
% Output:  
% yhat: estimated signal 
%

L    = length(y);
yhat = zeros(L, 1);
for j = 1 + season*lagUnit:L
    yhat(j) = theta*(y(j - season*lagUnit) - yhat(j - season*lagUnit));
end
end

% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
