% main run

x0 = 0:0.1:5;

% true second derivative
r = cos(x0);

% take numeric derivative of sin function
y = diff(@sin,x0);

% result is a vector
% draw both and compare
plot(x0,y,'-b');
% hold on;
plot(x0,r,'-r');



%%
% plot the difference between real values and numerical differentiation
% (this is the error), test different values for step size (h)
clear;clc;
x0 = 0:0.1:5;

% values to take for step size when numerically differentiting
h = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8, 1e-9, 1e-10, 1e-15];
r = -cos(x0);

for i=1:length(h)
    y = diff_compare(@sin,x0,h(i));
    
    % calculate diff between real and numeric
    e(i) = max(abs(y-r));
end

%loglog(x0,y,'- .b');
loglog(h,e,'- .b');

%%
% calculate the difference between derivative with central method and 
% derivative with left/right approximation
clear;clc;

x0 = 0:0.1:5;

h = 1e-4;
r = -cos(x0);
% for central diff
y = diff_compare(@sin,x0,h,0);
% for right diff
y1 = diff_compare(@sin,x0,h,1);

% take the abs value because semilog
semilogy(x0,abs(y-r),'- .b',x0,abs(y1-r),'- .r');
grid on;


%%
% calculate second derivative
x0 = 0:0.1:5;

% take first derivative and fit a polynom
first_der_poly = polyfit(x0,y,5)

% calculate second derivative from first derivative
der_two_y = diff_compare(@(x)(polyval(first_der_poly,x)),x0,h,1); 

% calculate true value of second derivative
true_der_two = -sin(x0);

% plot bothto see the difference
plot(x0,der_two_y,'- .b');
hold on;
plot(x0, true_der_two, '- .r');

%%
% test gradient
% for functions of more than one input argument (x,y,z ....)
clear; clc;

h = 0.1

[X,Y] = meshgrid(-5:h:5);

% random function
Z = sin(X).*(Y.^2);

% true derivative
dzdx = cos(X).*(Y.^2);
dzdy = 2*sin(X).*(Y);

% step use 1e-2
[num_dzdx, num_dzdy] = gradient(Z,h);

% true der x
subplot(2,3,1);
mesh(X,Y,dzdx);

% true der y
subplot(2,3,2);
mesh(X,Y,dzdy);

% numeric derr x
subplot(2,3,3);
mesh(X,Y,num_dzdx);

% numeric derr y
subplot(2,3,4);
mesh(X,Y,num_dzdy);

% draw error x
subplot(2,3,5);
mesh(X,Y,dzdx - num_dzdx);

% draw error y
subplot(2,3,6);
mesh(X,Y,dzdy - num_dzdy);

%%
% calculate gradient of one variable function
clear;clc;


h = 0.01;
x0 = 0:h:5;
r = cos(x0);
z = sin(x0);
[dzdx] = gradient(z,h);

% make new window
subplot(1,1,1);
plot(x0, r, '- .b', x0, dzdx, '-- .r');
grid on;