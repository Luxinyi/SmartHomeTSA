function [yhat] = MA2(y, lagUnit, theta1, theta2)
% 
% function [yhat] = MA2(y, lagUnit, phi1, phi2)
% 
% fit second order MA model to the given signal
% 
% Input: 
% y: original signal
% lagUnit: size of lag/ length of time step
% theta1: parameter of the first lag
% theta2: parameter of the second lag
%
% Output:  
% yhat: estimated signal 
%
if ~exist('lagUnit', 'var')
    lagUnit = 1;
end
L    = length(y);
yhat = zeros(L, 1);
for j = 1 + 2*lagUnit:L
    yhat(j) = theta1*(y(j - lagUnit) - yhat(j - lagUnit)) + theta2*(y(j - 2*lagUnit) - yhat(j - 2*lagUnit));
end
end

% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
