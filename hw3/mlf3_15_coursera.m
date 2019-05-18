clc;
clear all;
N=1000;
w=[-1,-0.05,0.08,0.13,1.5,1.5]';
err=zeros(N,1);
for i=1:1000
x=-1+2*rand(N,2);
f=sign(x(:,1).^2+x(:,2).^2-0.6);
y=f;
index=(rand(N,1)<0.1);
y(index)=-y(index);
x=[ones(N,1),x,x(:,1).*x(:,2),x(:,1).^2,x(:,2).^2];
err(i)=sum(sign(x*w)~=y)/N;
end
Eout=mean(err)