%4th order Runge-Kutta
h = 0.001;   %timestep
t = 0:h:10;                  
y = zeros(1,length(t));  %preallocates space for y
y(1) = 1;    %initial condition
f = @(x,z) sin(x)+cos(x);   %slope               

for i = 1:(length(t)-1)      
k1 = h*f(t(i),y(i)); %Euler
k2 = h*f(t(i)+0.5*h, y(i)+0.5*k1); 
k3 = h*f(t(i)+0.5*h, y(i)+0.5*k2); 
k4 = h*f(t(i)+h, y(i)+k3); 
y(i+1) = y(i) + (1/6)*(k1+2*k2+2*k3+k4); 
end
figure(1);
plot(t,y, 'r')