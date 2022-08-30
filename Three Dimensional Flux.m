clear; close all; clc;
%Crear grid
N=10;
%Number of arrows
minX=0;maxX=10;
minY=0;maxY=10;
minZ=0;maxZ=10;
%Graph 
x=linspace(minX,maxX,N);
y=linspace(minY,maxY,N);
z=linspace(minZ,maxZ,N);
[xG,yG,zG]=meshgrid(x,y,z);
%position of negative particle
xCn=0; yCn=0; zCn=0; a=0.4;
%position of positive particle
xCp=0; yCp=0; zCp=0;
%Flux Density
Qn=0;
Qp=10e-9;
eps0 = 8.854e-12;
kC = 1/(4*pi*eps0);
Rx = xG - xCn;
Ry = yG - yCn;
Rz = zG - zCn;
R = sqrt(Rx.^2 + Ry.^2 + Rz.^2).^3;
Ex = kC .* Qn .* Rx ./ R;
Ey = kC .* Qn .* Ry ./ R;
Ez = kC .* Qn .* Rz ./R;
Rx = xG - xCp;
Ry = yG - yCp;
R = sqrt(Rx.^2 + Ry.^2).^3;
Ex = eps0*(Ex + kC .* Qp .* Rx ./ R);
Ey = eps0*(Ey + kC .* Qp .* Ry ./ R);
Ez = eps0*(Ez + kC .* Qp .* Rz ./ R);
E = sqrt(Ex.^2 + Ey.^2 + Ez.^2);
%components x, y
u = Ex./E;
v = Ey./E;
w = Ez./E;
plot3(x,y,z);
h=quiver3(xG,yG,zG,u,v,w,'autoscalefactor',0.6);
set(h,'color',[1 0 0],'linewidth',1.2);
axis([-1.5 1.5 -1.5 1.5]);
axis equal;
box on
h=rectangle('Position',[xCn-a/2,yCn-a/2,a,a],'curvature',[1 1]);
set(h,'Facecolor',[0 0 1],'Edgecolor',[0 0 1]);
text(0.43,0.05,'-','Color','white','FontSize',30);
h=rectangle('Position',[xCp-a/2,yCp-a/2,a,a],'curvature',[1 1]);
set(h,'Facecolor',[1 0 0],'Edgecolor',[1 0 1]);
text(-0.6,0,'+','Color','white','FontSize',30);
