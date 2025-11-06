w = 0:0.1:2*pi;
a=0.8;
real=1-a*cos(w);
img=a*sin(w);
magnitude = 1./sqrt(power(real,2)+power(img,2));
theta=-atan(img./real);
theta_degree=rad2deg(theta);

subplot(2,1,1)
plot(w,magnitude)
xlabel('Magnitude')
ylabel('Omega')
grid on;

subplot(2,1,2)
plot(w,theta_degree)
xlabel('Phase')
ylabel('Omega')
grid on;