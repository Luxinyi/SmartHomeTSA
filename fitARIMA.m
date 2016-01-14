function [yhat, par] = fitARIMA(y, lagUnit, p, d, q, m, P, D, Q)
% 
% function [yhat, par] = fitARIMA(y, lagUnit, p, d, q, m, P, D, Q)
% 
% model the given signal y using ARIMA
% 
% Input: 
% y: original signal
% lagUnit: size of lag/ length of time step
% p: order of AR terms
% d: order of difference
% q: order of MA terms
% P: order of AR terms (seasonal)
% D: order of difference (seasonal)
% Q: order of MA terms (seasonal)
%
% Output:  
% yhat: estimated signal
% par: estimated parameters
%

if ~exist('lagUnit', 'var')
    lagUnit = 1;
end

ts = y;

if exist('D', 'var') && D == 1
    ts = ts - backshift(ts, m*lagUnit);
end

if d == 1
    ts = ts - backshift(ts, lagUnit);
end


if ~exist('m', 'var') 
    if p == 0 && q == 0
        par = [];
        tshat = ts;
    end
        
    if p == 1 && q == 0
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par)), 0.5);
        tshat = AR1(ts, lagUnit, par);
    end
    
    if p == 2 && q == 0
        par = fminsearch(@(par)getRMSE(ts, AR2(ts, lagUnit, par(1), par(2))), [0.5, 0.5]);
        tshat = AR2(ts, lagUnit, par(1), par(2));
    end
    
    if p == 0 && q == 1
        par = fminsearch(@(par)getRMSE(ts, MA1(ts, lagUnit, par)), 0.5);
        tshat = MA1(ts, lagUnit, par);
    end
    
    if p == 0 && q == 2
        par = fminsearch(@(par)getRMSE(ts, MA2(ts, lagUnit, par(1), par(2))), [0.5, 0.5]);
        tshat = MA2(ts, lagUnit, par(1), par(2));
    end
    
    if p == 1 && q == 1
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2))), [0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2));
    end
else
    if p == 0 && q == 0 && P == 0 && Q == 1
       par = fminsearch(@(par)getRMSE(ts, MAseasonal(ts, lagUnit, par, m)), 0.5);
       tshat = MAseasonal(ts, lagUnit, par, m);
    end 
    
    if p == 1 && q == 0 && P == 1 && Q == 0
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m)), [0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m);
    end
    
    if p == 1 && q == 0 && P == 0 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par(1)) + MAseasonal(ts, lagUnit, par(2), m)), [0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + MAseasonal(ts, lagUnit, par(2), m);
    end 
    
    if p == 1 && q == 0 && P == 1 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m) + MAseasonal(ts, lagUnit, par(3), m)), [0.5, 0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m) + MAseasonal(ts, lagUnit, par(3), m);
    end 
    
    if p == 2 && q == 0 && P == 0 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, AR2(ts, lagUnit, par(1), par(2)) + MAseasonal(ts, lagUnit, par(3), m)), [0.5, 0.5, 0.5]);
        tshat = AR2(ts, lagUnit, par(1), par(2)) + MAseasonal(ts, lagUnit, par(3), m);
    end
    
    if p == 0 && q == 1 && P == 1 && Q == 0
        par = fminsearch(@(par)getRMSE(ts, MA1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m)), [0.5, 0.5]);
        tshat = MA1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m);
    end
    
    if p == 0 && q == 1 && P == 0 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, MA1(ts, lagUnit, par(1)) + MAseasonal(ts, lagUnit, par(2), m)), [0.5, 0.5]);
        tshat = MA1(ts, lagUnit, par(1)) + MAseasonal(ts, lagUnit, par(2), m);
    end
    
    if p == 0 && q == 1 && P == 1 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, MA1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m) + MAseasonal(ts, lagUnit, par(3), m)), [0.5, 0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + ARseasonal(ts, lagUnit, par(2), m) + MAseasonal(ts, lagUnit, par(3), m);
    end
    
    if p == 0 && q == 2 && P == 0 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, MA2(ts, lagUnit, par(1), par(2)) + MAseasonal(ts, lagUnit, par(3), m)), [0.5, 0.5, 0.5]);
        tshat = MA2(ts, lagUnit, par(1), par(2)) + MAseasonal(ts, lagUnit, par(3), m);
    end
    
    if p == 0 && q == 2 && P == 1 && Q == 0
        par = fminsearch(@(par)getRMSE(ts, MA2(ts, lagUnit, par(1), par(2)) + ARseasonal(ts, lagUnit, par(3), m)), [0.5, 0.5, 0.5]);
        tshat = MA2(ts, lagUnit, par(1), par(2)) + ARseasonal(ts, lagUnit, par(3), m);
    end
    
        
    if p == 1 && q == 1 && P == 1 && Q == 0
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2)) + ARseasonal(ts, lagUnit, par(3), m)), [0.5, 0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2)) + ARseasonal(ts, lagUnit, par(3), m);
    end
    
    if p == 1 && q == 1 && P == 0 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2)) + MAseasonal(ts, lagUnit, par(3), m)), [0.5, 0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2)) + MAseasonal(ts, lagUnit, par(3), m);
    end
       
    if p == 1 && q == 1 && P == 1 && Q == 1
        par = fminsearch(@(par)getRMSE(ts, AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2)) + ARseasonal(ts, lagUnit, par(3), m) + MAseasonal(ts, lagUnit, par(4), m)), [0.5, 0.5, 0.5, 0.5]);
        tshat = AR1(ts, lagUnit, par(1)) + MA1(ts, lagUnit, par(2)) + ARseasonal(ts, lagUnit, par(3), m) + MAseasonal(ts, lagUnit, par(4), m);
    end
end

if d == 1
    tshat = tshat + backshift(y, lagUnit);
end

if exist('D', 'var') && D == 1
    tshat = tshat + backshift(y, m*lagUnit) - backshift(y, (m + 1)*lagUnit);
end

yhat = tshat;

end

% programmer: Lucy Lu
% 
% initial draft: 11/2015
% revision history 
%
    
    


