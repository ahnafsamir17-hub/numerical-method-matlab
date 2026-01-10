function [root,fx,ea,iter]= newton_raphson(func,dfunc,x0,es,maxit)
if nargin<3
    error;
end
if nargin<4 | isempty(es)
    es=0.0001;
end
if nargin<5 | isempty(maxit)
    maxit=50;
end
iter=0;xr=x0;ea=100;
while(1)
    xrold=xr;
    xr=xr-func(xr)/dfunc(xr);
    iter=iter+1;
    if xr~=0
        ea=abs((xr-xrold)/xr)*100;
    end
    if ea<=es || iter>=maxit
        break
    end
end
root=xr; fx=func(xr);

