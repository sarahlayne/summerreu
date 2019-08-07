function RK41(f,a,x0,y0,h)

% Runge Kutta Method 4th Order 
function @(x,y)x.^2 + y
a = 5
xo = 2
yo = 4 
h = 0.01 %step size

x = x0:h:a; 
y(1) = y0;

for i=1:(length(x)-1) 

k1 = f(x(i),y(i)); 
k2 = f(x(i)+0.5*h,y(i)+0.5*h*k1); 
k3 = f((x(i)+0.5*h),(y(i)+0.5*h*k2)); 
k4 = f((x(i)+h),(y(i)+k3*h)); 

y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4)*h;

end

y(:)