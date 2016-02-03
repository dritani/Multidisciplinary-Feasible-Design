% CONTOUR

clc
size=10;
x=linspace(-size,size);
y=linspace(-size,size);
[X,Y]=meshgrid(x,y);
y1=10;
y2=10;
Z=y1 + cos(y2) - 20*exp(- (X - 1).^2 - (Y - 1).^2/4);
contour(X,Y,Z,200)
