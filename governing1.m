function R1 = governing1(x1,x2,y1,y2)

tx1=x1+1;
tx2=x2+1;
%
ta1=tx1^2;
ta2=tx2^2;
tb2=ta2*0.25;
%
tc=ta1+tb2;
td=-tc;
te=exp(td);
tf=3*te;
%
R1=y1+tf-sin(y2);


end