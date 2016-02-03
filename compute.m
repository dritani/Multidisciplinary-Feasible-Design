function dfdx=compute(x1,x2)

y2=1;


i=0;
while(1)
   i=i+1;
   if i==100
       break
   end
   y1=-3*exp(-(x1+1)^2 + 0.25* (x2+1)^2) + sin(y2);
   y2=-3*exp(-5*(x1-3)^2 + 0.25* (x2-3)^2) + exp(-y1);
end

Arow1 = [1 0 -cos(y2) 0];
Arow2 = [0 1 0 -cos(y2)];
Arow3 = [exp(-y1) 0 1 0];
Arow4 = [0 exp(-y1) 0 1];

A = [Arow1;Arow2;Arow3;Arow4];

brow1=3*exp(- (x1 + 1)^2 - (x2 + 1)^2/4)*(2*x1 + 2);
brow2=3*exp(- (x1 + 1)^2 - (x2 + 1)^2/4)*(x2/2 + 1/2);
brow3=3*exp(- 5*(x1 - 3)^2 - (x2 - 3)^2/4)*(10*x1 - 30);
brow4=3*exp(- 5*(x1 - 3)^2 - (x2 - 3)^2/4)*(x2/2 - 3/2);

b = [brow1;brow2;brow3;brow4];

% | y1x1 |
% | y1x2 |
% | y2x1 |
% | y2x2 |

dydx=inv(A)*b;
dfrow1=20*exp(- (x1 - 1)^2 - (x2 - 1)^2/4)*(2*x1 - 2)+1*dydx(1)-(sin(y2))*dydx(3);
dfrow2=20*exp(- (x1 - 1)^2 - (x2 - 1)^2/4)*(x2/2 - 1/2)+1*dydx(2)-(sin(y2))*dydx(4);
dfdx=[dfrow1;dfrow2];


end