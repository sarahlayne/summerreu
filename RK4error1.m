%4th order Runge-Kutta
clear all
w = 1;
y0 = 1; % initial conditions
z0 = 1;
f = @(t,y,z) z;
g = @(t,y,z)(-w^2)*y;
    
hvec = 0.001:0.001:0.01;
evec = zeros(size(hvec));
for n = 1:length(hvec) 
    h = hvec(n);
    t = 0:h:10;
    yvec = zeros(1,length(t));  %preallocates space for a
    zvec = zeros(1,length(t));  %preallocates space for p
    zvec(1) = z0; yvec(1) = y0; %initial condition

    for i = 1:(length(t)-1)
        k1f(i) = h*f(t(i),yvec(i),zvec(i)); %Euler method
        k1g(i) = h*g(t(i),yvec(i),zvec(i)); %Euler method
        k2f(i) = h*f(t(i)+0.5*h, yvec(i)+0.5*k1f(i), zvec(i)+0.5*k1g(i)); 
        k2g(i) = h*g(t(i)+0.5*h, yvec(i)+0.5*k1f(i), zvec(i)+0.5*k1g(i));
        k3f(i) = h*f(t(i)+0.5*h, yvec(i)+0.5*k2f(i), zvec(i)+0.5*k2g(i)); 
        k3g(i) = h*g(t(i)+0.5*h, yvec(i)+0.5*k2f(i), zvec(i)+0.5*k2g(i));
        k4f(i) = h*f(t(i)+h, yvec(i)+k3f(i), zvec(i)+k3g(i)); 
        k4g(i) = h*g(t(i)+h, yvec(i)+k3f(i), zvec(i)+k3g(i)); 
        yvec(i+1) = yvec(i) + (1/6)*(k1f(i)+2*k2f(i)+2*k3f(i)+k4f(i));  
        zvec(i+1) = zvec(i) + (1/6)*(k1g(i)+2*k2g(i)+2*k3g(i)+k4g(i));
    end
    size(t)
    size(yvec)
    size(zvec)
    ac = cos(t) + sin(t);
    v = abs(yvec-ac);
    e = max(v); %max norm
    evec(n) = e;
    figure(1);
    plot(t,yvec,'.-k','MarkerSize',12)
    title('RK4 approx')
    hold on
    plot(t,ac,'.-r','MarkerSize',8)
    hold off
end
figure(2);
loglog(hvec,evec, 'k', 'LineWidth', 3)
xlabel('timestep h', 'fontsize', 16)
ylabel('error', 'fontsize', 16)
grid on