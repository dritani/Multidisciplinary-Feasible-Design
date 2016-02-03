% finite difference first order
%df/dx=(f(x+h)-f(x))/h + O(h);

% finite difference second order
%df/dx=(f(x+h)-f(x-h))/2h +O(h^2);

% direct method

% adjoint method

% Warcraft 3 color LB
%color=[126/255 191/255 241/255];
%plot(1,1,'Marker','x','Color',color','LineWidth',5)
clc
x1=-0.1;
x2=-1;

y1=-log(3)-exp((- 5*(x1 - 3)^2 - (x2 - 3)^2/4))
%y1=(- 5*(x1 - 3)^2 - (x2 - 3)^2/4)^3;
y2=3*exp(- (x1 + 1)^2 - (x2 + 1)^2/4)
y2=asin(y2)
cos(y2)
Hk=eye(2);
%sin(y2)

LHS=[1 0 -sin(y2) 0; exp(-y1) 0 0 0;0 1 0 -sin(y2);0 exp(-y1) 0 0];
RHS1=-3*exp(- (x1 + 1)^2 - (x2 + 1)^2/4)*(2*x1 + 2);
RHS2=3*exp(- 5*(x1 - 3)^2 - (x2 - 3)^2/4)*(10*x1 - 30);
RHS3=-3*exp(- (x1 + 1)^2 - (x2 + 1)^2/4)*(x2/2 + 1/2);
RHS4=3*exp(- (x1 + 1)^2 - (x2 + 1)^2/4)*(x2/2 + 1/2);

RHS=[RHS1;RHS2;RHS3;RHS4];

dydx=inv(LHS)*RHS;
%y1x1,y1x2,y2x1,y2x2

dfdx=[20*exp(- (x1 - 1)^2 - (x2 - 1)^2/4)*(2*x1 - 2)+1 ...
    *dydx(1)-sin(y2)*dydx(3);    20*exp(- (x1 - 1)^2 - (x2 ...
    - 1)^2/4)*(x2/2 - 1/2)+1*dydx(2)-sin(y2)*dydx(4)];


deltaX=-Hk*dfdx;%?

%df/dx=(f(x+h)-f(x))/h + O(h);
%df/dx=(f(x+h)-f(x-h))/2h +O(h^2);

h=0.000000001;
x1=-0.1;
x2=-1;
format long

y1=-0.346765878359960
y2=1.414485524930436
firstorder=(feval('testfunction',x1+h,x2,y1,y2)-feval('testfunction',x1,x2,y1,y2))/h
secondorder=(feval('testfunction',x1+h,x2,y1,y2)-feval('testfunction',x1-h,x2,y1,y2))/(2*h)






