function [root, fx, ea, iter] = bisect(func, xl, xu, es, maxit)

% uses bisection method to find the root of func
% func = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001)
% maxit = maximum allowable iterations (default = 50)

if nargin < 3
    error('at least 3 input arguments required')
end

test = func(xl) * func(xu);
if test > 0
    error('roots cannot be found with these bounds')
end

if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 50;
end

iter = 0;
xr = xl;
ea = 100;

while (1)
    xrold = xr;
    xr = (xl + xu)/2;
    iter = iter + 1;

    if xr ~= 0
        ea = abs((xr - xrold)/xr) * 100;
    end

    test = func(xl) * func(xr);
    if test < 0
        xu = xr;
    elseif test > 0
        xl = xr;
    else
        ea = 0;
    end

    if ea <= es || iter >= maxit
        break
    end
end

root = xr;
fx = func(xr);