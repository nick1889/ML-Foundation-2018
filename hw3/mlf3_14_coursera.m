clc;
clear all;
N=1000;
ws=zeros(6,N);
err=zeros(N,1);
for i=1:1000
x=-1+2*rand(N,2);
f=sign(x(:,1).^2+x(:,2).^2-0.6);
y=f;
index=(rand(N,1)<0.1);
y(index)=-y(index);
x=[ones(N,1),x,x(:,1).*x(:,2),x(:,1).^2,x(:,2).^2];
w=pinv(x)*y;
ws(:,i)=w;
err(i)=sum(sign(x*w)~=y)/N;
end
w_mean=mean(ws,2)