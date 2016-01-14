function [yhat] = ARseasonal(y, lagUnit, phi, season)
% 
% function [yhat] = ARseasonal(y, lagUnit, phi, season)
% 
% fit seasonal AR model to the given signal
% 
% Input: 
% y: original signal
% lagUnit: size of lag/ length of time step
% phi: parameter of the seasonal term
% season: number of lags in a season
%
% Output:  
% yhat: estimated signal 
%

if ~exist('lagUnit', 'var')
    lagUnit = 1;
end
yhat = phi*backshift(y, season*lagUnit);
end

% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
