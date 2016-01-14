function sdf = getSDF(acf, lagMax)
%
% function sdf = getSDF(pacf)
% 
% get the spectral density function of the given autocorrelation function
%
% Input:
% pacf: partial autocorrelation function
% 
% Output:
% sdf: spectral density function
%
sdf = dct(acf, lagMax);
% sdf = fftshift(sdf);

end

% programmer: Lucy Lu
% 
% initial draft: 10/2015
% revision history 
%
