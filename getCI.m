function [c1, c2] = getCI(f, lagMax)
% 
% function [c1, c2] = getCI(f, lagMax)
% 
% calculate the 95% confidence interval for the autocorrelation function f
% 
% Input: 
% f: autocorrelation function
% lagMax: number of lags
%
% Output:  
% c1: lower bond of the 95% CI 
% c2: higher bond of the 95% CI 
%

c1 = zeros(lagMax, 1);
y  = f.^2;
for i = 1:lagMax
    c1(i) = 1.96*sqrt((2*sum(y(1:i)) + 1)/length(f));
end
c2 = -c1;
return 

end

% programmer: Lucy Lu
% 
% initial draft: 10/2015
% revision history 
%
