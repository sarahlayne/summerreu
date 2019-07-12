%euler method 2nd order
h = 0.01;  % step size
b = 0:h:6.5;  
y = [zeros(size(b))];
z = [zeros(size(b))];
z(1) = 2;  % y0
y(1) = 1;
w = 1;
t = numel(y);  % the number of y values
for n=1:t-1
    f = -w^2*z(n);
    y(n+1) = y(n) + h * f;
    g = y(n); 
    z(n+1) = z(n) + h * g;
end
plot (b,z, '.r', 'MarkerSize', 10)
hold on
b = 0:h:6.5;
ac = 2*cos(b*w) + 1/w*sin(b*w); %period 2pi/w
plot(b,ac,'.g', 'MarkerSize', 5);
hold off
