function [b] = backshift(y, m)
% function [b] = backshift(y, m)
% 
% back shift y m time steps
%
% input:
% y: original signal
% m: number of time steps to shift back
%
% output: 
% b: bakshifted signal (complemented by zeros at the beginning to keep the
% same length as y)
%
if ~exist('lagUnit', 'var')
    lagUnit = 1;
end
L = length(y);
b = [zeros(m, 1); y(1:L - m)];
end



% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
