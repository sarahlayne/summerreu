%4th order Runge-Kutta
clear all
w = 1;
y0 = 1; % initial conditions
z0 = 1;
f = @(t,y,z) z;
g = @(t,y,z)(-w^2)*y;
    
hvec = 0.001:0.01:0.1;
evec = zeros(size(hvec));
for n = 1:length(hvec) 
    h = hvec(n);
    t = 0:h:10; 
    k1 = zeros(size(t));
    k2 = zeros(size(t));
    k3 = zeros(size(t));
    k4 = zeros(size(t));
    yvec = zeros(1,length(t));  %preallocates space for y
    zvec = zeros(1,length(t));  %preallocates space for z
    zvec(1) = z0; yvec(1) = y0; %initial condition
    
    for i = 1:(length(t)-1)
        k1(i) = h*f(t(i),yvec(i),zvec(i)); %Euler method
        k2(i) = h*f(t(i)+0.5*h, yvec(i)+0.5*k1(i), zvec(i)+0.5*k1(i)); 
        k3(i) = h*f(t(i)+0.5*h, yvec(i)+0.5*k2(i), zvec(i)+0.5*k2(i)); 
        k4(i) = h*f(t(i)+h, yvec(i)+k3(i), zvec(i)+k3(i)); 
        yvec(i+1) = yvec(i) + (1/6)*(k1(i)+2*k2(i)+2*k3(i)+k4(i));  
        k1(i) = h*g(t(i),yvec(i),zvec(i)); %Euler method
        k2(i) = h*g(t(i)+0.5*h, yvec(i)+0.5*k1(i), zvec(i)+0.5*k1(i)); 
        k3(i) = h*g(t(i)+0.5*h, yvec(i)+0.5*k2(i), zvec(i)+0.5*k2(i)); 
        k4(i) = h*g(t(i)+h, yvec(i)+k3(i), zvec(i)+k3(i));  
        zvec(i+1) = zvec(i) + (1/6)*(k1(i)+2*k2(i)+2*k3(i)+k4(i));
    end
    ac = cos(t) + sin(t);
    v = abs(yvec-ac);
    e = max(v); %max norm
    evec(n) = e;
%     plot(t,yvec,'.-k','MarkerSize',16)
%     hold on
%     plot(t,ac,'.-r','MarkerSize',16)
%     hold off
end
loglog(hvec,evec, 'k', 'MarkerSize', 16)
title('4th Order Runge-Kutta Convergence')
xlabel('time-step (h)')
ylabel('error')
grid on