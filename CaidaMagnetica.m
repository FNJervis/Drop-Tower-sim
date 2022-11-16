%simulacion de caida magnetica con respecto al tiempo
clear 
clc
close all
%ecuacion
%(-(9*U*Mu0*a^4)/(m4R)) * ((y(1)^2)/(y(1)+a^)^5/2)

t=[0 12]; %vector de tiempos
altura0=input('Ingrese la altura de la gondola: '); %altura inicial
velocidad0=0;


masa=input('Ingrese la masa de la gondola: ');   %masa de la gondola
radio=input('Ingrese el radio de la gondola: '); 
g=9.81;     %gravedad
U=1000000;  %Maxima permeabilidad relativa del MetGlass
Mu0=4*pi*(10^-7);   %Permeabilidad del vacio

R=0.00009; %Resistividad

f=-masa*g/masa;

k=(9*(U*Mu0)^2*(radio^4))/(4*masa*R);


dzdt=@(t,x) [x(2);-((k.*x(1).^2)*(x(2)))./(((x(1)+radio).^(5/2))) + f];

[t,z]=ode45(dzdt,t,[altura0 velocidad0]);

plot(t,z(:,1));

title('Caida Magnetica')
xlabel('Tiempo (segundos)');
ylabel('Altura (metros)');




