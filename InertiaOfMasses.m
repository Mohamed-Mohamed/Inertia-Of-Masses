function [ x_G, y_G, z_G, IM ] = InertiaOfMasses( m, x, y, z )
% this function is used to get inertia matrix of some of masses
%% Coded by
% Mohamed Mohamed El-Sayed Atyya
% mohamed.atyya94@eng-st.cu.edu.eg
%% inputs
% m  : vector of massses (1xn)
% x   : x  co-ordinate vector of massses (1xn) 
% y   : y  co-ordinate vector of massses (1xn) 
% z   : z  co-ordinate vector of massses (1xn) 
%% outputs
% x_G       : x  co-ordinate of the center of masses
% y_G       : y  co-ordinate of the center of masses
% z_G       : z  co-ordinate of the center of masses
% IM         : the total inertia matrix
% -----------------------------------------------------------------------------------------------------------------------------------------------------------
M=sum(m)
x_G=sum(x.*m)/M
y_G=sum(y.*m)/M
z_G=sum(z.*m)/M
Ixx=m.*(y.^2+z.^2)
Iyy=m.*(x.^2+z.^2)
Izz=m.*(x.^2+y.^2)
Ixy=-m.*x.*y
Ixz=-m.*x.*z
Iyz=-m.*y.*z
for n=1:length(m)
    Im{n}=[Ixx(n), Ixy(n), Ixz(n); Ixy(n), Iyy(n), Iyz(n); Ixz(n), Iyz(n), Izz(n)];
end
celldisp(Im);
IM=zeros(3,3);
for k=1:length(m)
    IM=IM+Im{k};
end
end