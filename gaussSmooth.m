function [s] = gaussSmooth(y, resolution)
% function [s] = MAS(y, resolution)
% 
% smooth y using an moving-average filter to the desired resolution
%
% input:
% y: original signal (resolution = 1 sec)
% resolution: desired resolution in terms of second (window width)
%
% output:
% s: smoothed signal
%
gaussFilter = gausswin(resolution);
gaussFilter = gaussFilter/sum(gaussFilter);
s           = conv(y, gaussFilter);



% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
