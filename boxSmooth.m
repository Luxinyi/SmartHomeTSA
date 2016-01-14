function [s] = boxSmooth(y, resolution)
% function [s] = boxSmooth(y, resolution)
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
L = length(y);
s = zeros(L, 1);
if mod(resolution, 2) == 1
    d = (resolution - 1)/2;
    s(d + 1) = mean(sum(y(1:2*d + 1)));
    for i = d + 2:L - d
        s(i) = s(i - 1) - y(i - d - 1) + y(i + d);
    end
else
    d = resolution/2;
    s(d) = mean(sum(y(1:resolution)));
    for i = d + 1:L - d
        s(i) = s(i - 1) - y(i - d) + y(i + d);
    end
end



% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
