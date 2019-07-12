%euler's method 1st order
h = 0.01;  
x = 1:h:5; 
y = zeros(size(x));
y(1) = 8; 
t = numel(y);
for n=1:t-1
    f = 2*y(n);
    y(n+1) = y(n) + h * f;
end
plot(x,y, 'b')
hold on
v = 1:h:5;
g = exp(2*v);
plot(v,g, 'g')
hold off