function r2 = getR2(y, yhat)
% 
% function r2 = getR2(y, yhat)
% 
% calculate the model's coefficient of determination 
% 
% Input: 
% y: original signal
% yhat: estimated signal
%
% Output:  
% r2: coefficient of determination
%

r2 = 1 - sum((y - yhat).^2)/sum((y - mean(y)).^2);

end

% programmer: Lucy Lu
% 
% initial draft: 10/2015
% revision history 
%
