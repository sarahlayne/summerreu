[x,t] =meshgrid(0:0.5:10, 0.01:0.01:5);
z = 1./sqrt(4.*pi.*t).*exp(-x.^2./(4.*t));
surf(x,t,z,'edgecolor','none')

