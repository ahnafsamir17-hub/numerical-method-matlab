function [root,fx,ea,iter] = regula_falsi(func,xl,xu,es,maxit)
if nargin < 3
    error;
end
test = func(xl)*func(xu);
if test>0
    error
end
if nargin<4 || isempty(es)
    es = 0.0001;
end
if nargin<5 || isempty(maxit)
    iter=50; 
end
iter=0;
xr = xl;
ea=100;
while (1)
    xrold=xr;
    xr=xu-func(xu)*(xl-xu)/(func(xl)-func(xu));
    iter=iter+1;
    if xr~=0
        ea=abs(xu-func(xu)*(xl-xu)/(func(xl)-func(xu)))*100;
    end
    test=func(xl)*func(xu);
    if test<0
        xu=xr;
    elseif test>0
        xl=xr;
    else
        ea=0;
    end
    if ea<=es | iter>=maxit,break, end
end
root=xr;fx=func(xr);
