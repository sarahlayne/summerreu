%euler method 2nd order
clear all
hvec = 0.00001:0.0001:0.001;
evec = zeros(size(hvec));
for i = 1:length(hvec) 
    h = hvec(i);
    b = 0:h:6.5;  
    y = zeros(size(b));
    z = zeros(size(b));
    z(1) = 2; y(1) = 1; w = 1;
    t = numel(y);  % the number of y values
    for n=1:t-1
        f = -w^2*z(n);
        y(n+1) = y(n) + h * f;
        g = y(n); 
        z(n+1) = z(n) + h * g;
    end
%     figure(4)
%     plot (b,z, '.r', 'MarkerSize', 10)
%     title('Euler approx')
%     hold on
    ac = 2*cos(b*w) + 1/w*sin(b*w); %period 2pi/w
%     plot(b,ac,'.g', 'MarkerSize', 8);
%     hold off
    v = abs(z-ac);
    C=2; p=3;
    e = max(v); %max norm
    evec(i) = e;
end
figure(5)
loglog(hvec, evec, 'k', 'LineWidth', 3)
xlabel('timestep')
ylabel('error')
grid on