clear
clc

format long
i=0;
derr=zeros(14,2);
purp=zeros(14);
while(1)
    i=i+1;
    if i==15
        break
    end
    h=10^(-i);
    purp(i)=h;
    [dfdx_first,dfdx_second]=derivatives(h);
    derr(i,1)=dfdx_first(2);
    derr(i,2)=dfdx_second(2);

    
end

    h=0.0000001;
    [dfdx_first,dfdx_second]=derivatives(h);
    dfdx_first;
    dfdx_second;
% direct/adjoint:
dfdx_direct=feval('compute',-0.1,-1);
derr;

i=0;
while(1)
    i=i+1;
    if i==15
        break
    end
    
derr(i,1)=derr(i,1)-dfdx_direct(2);
derr(i,2)=derr(i,2)-dfdx_direct(2);
end

derr=abs(derr);

h1=loglog(purp,derr(:,1),'Color','green','Marker','o');
hold on
h2=loglog(purp,derr(:,2),'Color','blue','Marker','o');
hold off
xlabel('Disturbance h')
ylabel('Log(Error))')
title('Finite Difference Gradient Convergence: df/dx2')
set(gca, 'XDir', 'reverse')
legend('First Order','Second Order')

