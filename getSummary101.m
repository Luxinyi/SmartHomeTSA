function s_summary101 = getSummary101(s)
% 
% function s_summary101 = getSummary101(s)
% 
% get summary statistics of the given signal 
% 
% Input: 
% s:signal
%
% Output:  
% s_summary101:[minimum, 25-percentile, median, 75-percentile, maximum,
%              mean, variance]
% 

s_summary101 = zeros(7,1);

for j = 1:5
    s_summary101(j, 1) = quantile(s, 0.25*(j-1));
end
s_summary101(6, 1) = nanmean(s);
s_summary101(7, 1) = nanvar(s);


C = {'min:', '25%:', 'median:', '75%:', 'max:', 'mean:', 'variance:';
    s_summary101(1), s_summary101(2), s_summary101(3), s_summary101(4), s_summary101(5), s_summary101(6),s_summary101(7)};    
sum = sprintf('%s    %d\n', C{:});
disp(sum);

end 

% programmer: Lucy Lu
% 
% initial draft: 10/2015
% revision history 
%

