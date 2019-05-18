u=0;
v=0;
% eta=0.01;
%E=exp(u)+exp(2*v)+exp(u*v)+u^2-2*u*v+2*v^2-3*u-2*v;
for i=1:5
    du=exp(u)+v*exp(u*v)+2*u-2*v-3;
    dv=2*exp(2*v)+u*exp(u*v)-2*u+4*v-2;
    du2=exp(u)+v^2*exp(u*v)+2;
    dv2=4*exp(2*v)+u^2*exp(u*v)+4;
    dudv=exp(u*v)+v*u*exp(u*v)-2;
    del=inv([du2,dudv;dudv,dv2])*[du;dv];
    u=u-del(1);
    v=v-del(2);
end
E=exp(u)+exp(2*v)+exp(u*v)+u^2-2*u*v+2*v^2-3*u-2*v