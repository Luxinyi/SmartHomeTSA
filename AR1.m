function [yhat] = AR1(y, lagUnit, phi)
% 
% function [yhat] = AR1(y, lagUnit, phi)
% 
% fit first order AR model to the given signal
% 
% Input: 
% y: original signal
% lagUnit: size of lag/ length of time step
% phi: parameter of the first lag
%
% Output:  
% yhat: estimated signal 
%

if ~exist('lagUnit', 'var')
    lagUnit = 1;
end
yhat = phi*backshift(y, lagUnit);
end

% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
