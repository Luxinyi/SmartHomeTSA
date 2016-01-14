function [yhat] = MA1(y, lagUnit, theta)
% 
% function [yhat] = MA1(y, lagUnit, phi)
% 
% fit first order MA model to the given signal
% 
% Input: 
% y: original signal
% lagUnit: size of lag/ length of time step
% theta: parameter of the first lag
%
% Output:  
% yhat: estimated signal 
%

if ~exist('lagUnit', 'var')
    lagUnit = 1;
end
L    = length(y);
yhat = zeros(L, 1);
for j = 1 + lagUnit:length(y)
    yhat(j) = theta*(y(j - lagUnit) - yhat(j - lagUnit));
end
end

% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
