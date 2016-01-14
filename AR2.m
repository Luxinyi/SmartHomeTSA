function [yhat] = AR2(y, lagUnit, phi1, phi2)
% 
% function [yhat] = AR2(y, lagUnit, phi1, phi2)
% 
% fit second order AR model to the given signal
% 
% Input: 
% y: original signal
% lagUnit: size of lag/ length of time step
% phi1: parameter of the first lag
% phi2: parameter of the second lag
%
% Output:  
% yhat: estimated signal 
%
if ~exist('lagUnit', 'var')
    lagUnit = 1;
end
yhat = phi1*backshift(y, lagUnit) + phi2*backshift(y, 2*lagUnit);
end

% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
