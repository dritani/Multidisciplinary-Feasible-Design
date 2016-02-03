function R2 = governing2(x1,x2,y1,y2)

tx1=x1-3;
tx2=x2-3;
%
ta1=tx1^2;
ta2=tx2^2;
tb1=5*ta1;
tb2=ta2*0.25;
%
tc=tb1+tb2;
td=-tc;
te=exp(td);
tf=3*te;
%
R2=y2+tf-exp(-y1);

end