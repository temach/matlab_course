function myfunc_draw()
step=0.5;
x = -5:step:5;
y = -5:step:5;
[X, Y] = meshgrid(x,y);
F = x.^2 - 2.*y.*x + 4.*(y.^3);
surf(X,Y,F);
view(18,55);
end