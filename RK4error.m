%4th order Runge-Kutta
hvec = 0.001:0.01:0.1;
evec = zeros(size(hvec));
for n = 1:length(hvec) 
    h = hvec(n);
    t = 1:h:10; 
    k1 = zeros(size(t));
    k2 = zeros(size(t));
    k3 = zeros(size(t));
    k4 = zeros(size(t));
    y = zeros(1,length(t));  %preallocates space for y
    z = zeros(1,length(t));  %preallocates space for z
    z(1) = 1; y(1) = 1; w = 1; %initial condition
    f = @(x,y) y(n);
    g = @(x,y)(-w^2)*x(n);
for i = 1:length(t)-1
    k1(i) = h*f(t(i),y(i)); %Euler method
    k2(i) = h*f(t(i)+0.5*h, y(i)+0.5*k1(i)); 
    k3(i) = h*f(t(i)+0.5*h, y(i)+0.5*k2(i)); 
    k4(i) = h*f(t(i)+h, y(i)+k3(i)); 
    y(i+1) = y(i) + (1/6)*(k1(i)+2*k2(i)+2*k3(i)+k4(i));  
    k1(i) = h*g(t(i),z(i)); %Euler method
    k2(i) = h*g(t(i)+0.5*h, z(i)+0.5*k1(i)); 
    k3(i) = h*g(t(i)+0.5*h, z(i)+0.5*k2(i)); 
    k4(i) = h*g(t(i)+h, z(i)+k3(i)); 
    z(i+1) = z(i) + (1/6)*(k1(i)+2*k2(i)+2*k3(i)+k4(i));
end
ac = cos(t) + sin(t);
v = abs(z-ac);
e = max(v); %max norm
evec(n) = e;
end
loglog(hvec,evec)
grid on