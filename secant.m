function [root, fx, ea, iter] = secant(func, x0, x1, es, maxit)

if nargin < 3
    error('at least 3 input arguments required')
end

if nargin < 4 || isempty(es)
    es = 0.0001;
end

if nargin < 5 || isempty(maxit)
    maxit = 50;
end

iter = 0;
ea = 100;

while (1)
    xr = x1 - func(x1) * (x1 - x0) / (func(x1) - func(x0));

    iter = iter + 1;

    if xr ~= 0
        ea = abs((x1 - x0)/x1) * 100;
    end

    x0 = x1;
    x1 = xr;

    if ea <= es || iter >= maxit
        break
    end
end

root = xr;
fx = func(xr);