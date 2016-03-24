% polyfit to find best fit curve
x=[10.1 10.2 10.3 10.8 10.9 11 11.1 11.4 12.2 13.3 13.8 14 14.4 15  15.6 15.8 17  18.1 19];
y=[24   36   26   45   34   37 55   51   75   84   74   91 85    87 94   92   96  97   98];
hold on;
plot(x,y,'. ');

a=polyfit(x,y,1);
b=polyfit(x,y,2);

t=x(1):0.1:x(end);
y1=polyval(a,t);
y2=polyval(b,t);
plot(t,y1,'r -');
plot(t,y2,'g -');
grid on;

A=zeros(2,2);
p=zeros(2,1);

A(1,1)=length(x);
A(1,2)=sum(x,2);
A(2,1)=sum(x,2);
A(2,2)=sum(x.^2,2);
p(1)=sum(y,2);
p(2)=sum(x.*y);

v=A\p;

y3=t*v(2)+v(1);

plot(t,y3,'k --');


%%
% now the model is y = c0 + c1*x^2 + c2*x^3
% we take derivative along each c0, c1, c2
% then we set each derivative equal to zero
% then we get 3 equations with 3 unknows and 1 numerical
% express c0,c1,c2 in terms of numerical (constant)
% then write the matrix A(c0;c1;c2) = (k1;k2;k3)
% solve: v = A\p
% 
%
% 2 * (yi - c0 - c1*xi^2 - c2*xi^3) * -c0
% 2 * (yi - c0 - c1*xi^2 - c2*xi^3) * -2*c1*xi
% 2 * (yi - c0 - c1*xi^2 - c2*xi^3) * -3*c2*xi^2
%
% 2*yi*(-c0) -2*c0*(-c0) - 2*c1*(-c0)*xi^2 - 2*c2*(-c0)*xi^3)
% 2*yi*(-2*c1*xi) - 2*c0*(-2*c1*xi) - 2*c1*(-2*c1*xi)*xi^2 - 2*c2*(-2*c1*xi)*xi^3)
% yi*(-6*c2*xi^2) - c0*(-6*c2*xi^2) - c1*(-6*c2*xi^2)*xi^2 - c2*(-6*c2*xi^2)*xi^3

x=[10.1 10.2 10.3 10.8 10.9 11 11.1 11.4 12.2 13.3 13.8 14 14.4 15  15.6 15.8 17  18.1 19];
y=[24   36   26   45   34   37 55   51   75   84   74   91 85    87 94   92   96  97   98];
hold on;
plot(x,y,'. ');

a = zeros(3,3)
p = zeros(3,1)

a(1,1) = length(x)
a(1,2) = sum(x.^2);
a(1,3) = sum(x.^3);

a(2,1) = sum(x.^2)
a(2,2) = sum(x.^4);
a(2,3) = sum(x.^5);

a(3,1) = sum(x.^3);
a(3,2) = sum(x.^5);
a(3,3) = sum(x.^6);

p(1) = sum(y)
p(2) = sum((x.^2).*y)
p(3) = sum((x.^3).*y)

v = a\p;

t=x(1):0.1:x(end);
y3=v(1) + v(2)*(t.^2) + v(3)*(t.^3);

plot(t,y3,'k --');



