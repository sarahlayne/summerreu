% 4th order Runge-Kutta

L = 2;
N = 64;
k = 10; % trail decay time
c = 1; % positive constant
p0 = 1;
a0 = k*p0/c;
mu = 1; % diffusion constant
h = 1; % positive constant
chi = 1; % repulsion constant

x = 2*pi*L/N*(-N/2:N/2-1);
tvec = 0.01;
for n = 1:length(tvec) 
    dt = tvec(n);
    t = 0:dt:0.1;
    amat = zeros(length(t),length(x));  % preallocates space for a
    pmat = zeros(length(t),length(x));  % preallocates space for rho
    amat(1, :) = a0 + 2*sin(x); pmat(1, :) = p0; % initial condition

    for i = 1:(length(t)-1)
        k1a = dt*f(t(i),amat(i,:),pmat(i,:), mu,chi); % Euler method
        k1p = dt*g(t(i),amat(i,:),pmat(i,:),h,k); % Euler method
        k2a = dt*f(t(i)+0.5*dt, amat(i,:)+0.5*k1a, pmat(i,:)+0.5*k1p, mu,chi); 
        k2p = dt*g(t(i)+0.5*dt, amat(i,:)+0.5*k1a, pmat(i,:)+0.5*k1p, h, k);
        k3a = dt*f(t(i)+0.5*dt, amat(i,:)+0.5*k2a, pmat(i,:)+0.5*k2p, mu,chi); 
        k3p = dt*g(t(i)+0.5*dt, amat(i,:)+0.5*k2a, pmat(i,:)+0.5*k2p, h, k);
        k4a = dt*f(t(i)+dt, amat(i,:)+k3a, pmat(i,:)+k3p, mu,chi); 
        k4p = dt*g(t(i)+dt, amat(i,:)+k3a, pmat(i,:)+k3p, h, k); 
        amat(i+1,:) = amat(i,:) + (1/6)*(k1a+2*k2a+2*k3a+k4a);  
        pmat(i+1,:) = pmat(i,:) + (1/6)*(k1p+2*k2p+2*k3p+k4p);
    end
end

for n = 1:length(t)
    plot(x, amat(n,:));
    title(['t = ' num2str(t(n))])
    pause
end;
function out = g(t,a,p,h,k)
    out = h*a - k*p;
end

function out = f(t,a,p,mu,chi)
L = 2;
N = 64;
k = [0:N/2-1 0 -N/2+1:-1]/L;
    k2 = [0:N/2-1 1*N/2 -N/2+1:-1]/L; 
    out = mu*(-ifft((k2.^2).*fft(a))) - chi*real(ifft(k.*fft(a.*real(ifft(k.*fft(p))))));
end
