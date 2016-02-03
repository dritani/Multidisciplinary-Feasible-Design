function [dfdx_first,dfdx_second]=derivatives(h)


y2=1;
x1=-0.1;
x2=-1;
i=0;
while(1)
   i=i+1;
   if i==100
       break
   end
   y1=-3*exp(-(x1+1)^2 + 0.25* (x2+1)^2) + sin(y2);
   y2=-3*exp(-5*(x1-3)^2 + 0.25* (x2-3)^2) + exp(-y1);
end


% FIRST ORDER
dfdx1_first=(feval('testfunction',x1+h,x2,y1,y2)-feval('testfunction',x1,x2,y1,y2))/h;
dfdx2_first=(feval('testfunction',x1,x2+h,y1,y2)-feval('testfunction',x1,x2,y1,y2))/h;
dfdy1_first=(feval('testfunction',x1,x2,y1+h,y2)-feval('testfunction',x1,x2,y1,y2))/h;
dfdy2_first=(feval('testfunction',x1,x2,y1,y2+h)-feval('testfunction',x1,x2,y1,y2))/h;

dR1x1_first=(feval('governing1',x1+h,x2,y1,y2)-feval('governing1',x1,x2,y1,y2))/h;
dR1x2_first=(feval('governing1',x1,x2+h,y1,y2)-feval('governing1',x1,x2,y1,y2))/h;
dR2x1_first=(feval('governing2',x1+h,x2,y1,y2)-feval('governing2',x1,x2,y1,y2))/h;
dR2x2_first=(feval('governing2',x1,x2+h,y1,y2)-feval('governing2',x1,x2,y1,y2))/h;

dR1y1_first=(feval('governing1',x1,x2,y1+h,y2)-feval('governing1',x1,x2,y1,y2))/h;
dR1y2_first=(feval('governing1',x1,x2,y1,y2+h)-feval('governing1',x1,x2,y1,y2))/h;
dR2y1_first=(feval('governing2',x1,x2,y1+h,y2)-feval('governing2',x1,x2,y1,y2))/h;
dR2y2_first=(feval('governing2',x1,x2,y1,y2+h)-feval('governing2',x1,x2,y1,y2))/h;



Arow1_1 = [dR1y1_first 0 dR1y2_first 0];
Arow2_1 = [0 dR1y1_first 0 dR1y2_first];
Arow3_1 = [dR2y1_first 0 dR2y2_first 0];
Arow4_1 = [0 dR2y1_first 0 dR2y2_first];

A_1 = [Arow1_1;Arow2_1;Arow3_1;Arow4_1];

brow1_1=-dR1x1_first;
brow2_1=-dR1x2_first;
brow3_1=-dR2x1_first;
brow4_1=-dR2x2_first;

b_1 = [brow1_1;brow2_1;brow3_1;brow4_1];

% | y1x1 |
% | y1x2 |
% | y2x1 |
% | y2x2 |

dydx_first=inv(A_1)*b_1;
dfrow1_1=dfdx1_first+dfdy1_first*dydx_first(1)+dfdy2_first*dydx_first(3);
dfrow2_1=dfdx2_first+dfdy1_first*dydx_first(2)+dfdy2_first*dydx_first(4);
dfdx_first=[dfrow1_1;dfrow2_1];



% SECOND ORDER
dfdx1_second=(feval('testfunction',x1+h,x2,y1,y2)-feval('testfunction',x1-h,x2,y1,y2))/(2*h);
dfdx2_second=(feval('testfunction',x1,x2+h,y1,y2)-feval('testfunction',x1,x2-h,y1,y2))/(2*h);
dfdy1_second=(feval('testfunction',x1,x2,y1+h,y2)-feval('testfunction',x1,x2,y1-h,y2))/(2*h);
dfdy2_second=(feval('testfunction',x1,x2,y1,y2+h)-feval('testfunction',x1,x2,y1,y2-h))/(2*h);

dR1x1_second=(feval('governing1',x1+h,x2,y1,y2)-feval('governing1',x1-h,x2,y1,y2))/(2*h);
dR1x2_second=(feval('governing1',x1,x2+h,y1,y2)-feval('governing1',x1,x2-h,y1,y2))/(2*h);
dR2x1_second=(feval('governing2',x1+h,x2,y1,y2)-feval('governing2',x1-h,x2,y1,y2))/(2*h);
dR2x2_second=(feval('governing2',x1,x2+h,y1,y2)-feval('governing2',x1,x2-h,y1,y2))/(2*h);

dR1y1_second=(feval('governing1',x1,x2,y1+h,y2)-feval('governing1',x1,x2,y1-h,y2))/(2*h);
dR1y2_second=(feval('governing1',x1,x2,y1,y2+h)-feval('governing1',x1,x2,y1,y2-h))/(2*h);
dR2y1_second=(feval('governing2',x1,x2,y1+h,y2)-feval('governing2',x1,x2,y1-h,y2))/(2*h);
dR2y2_second=(feval('governing2',x1,x2,y1,y2+h)-feval('governing2',x1,x2,y1,y2-h))/(2*h);


Arow1_2 = [dR1y1_second 0 dR1y2_second 0];
Arow2_2 = [0 dR1y1_second 0 dR1y2_second];
Arow3_2 = [dR2y1_second 0 dR2y2_second 0];
Arow4_2 = [0 dR2y1_second 0 dR2y2_second];

A_2 = [Arow1_2;Arow2_2;Arow3_2;Arow4_2];

brow1_2=-dR1x1_second;
brow2_2=-dR1x2_second;
brow3_2=-dR2x1_second;
brow4_2=-dR2x2_second;

b_2 = [brow1_2;brow2_2;brow3_2;brow4_2];

% | y1x1 |
% | y1x2 |
% | y2x1 |
% | y2x2 |

dydx_second=inv(A_2)*b_2;
dfrow1_2=dfdx1_second+dfdy1_second*dydx_second(1)+dfdy2_second*dydx_second(3);
dfrow2_2=dfdx2_second+dfdy1_second*dydx_second(2)+dfdy2_second*dydx_second(4);
dfdx_second=[dfrow1_2;dfrow2_2];


end



