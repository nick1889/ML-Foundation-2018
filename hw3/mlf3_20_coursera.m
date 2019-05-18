clc;
clear all;
train_data=load('hw3_train.dat');
test_data=load('hw3_test.dat');
T=2000;
eta=0.001;
[N,d]=size(train_data);
N_test=size(test_data,1);
train_x=train_data(:,1:d-1);
train_y=train_data(:,d);
test_x=test_data(:,1:d-1);
test_y=test_data(:,d);
w=zeros(d-1,1);
for t=1:2
    for i=1:N
        w=w+eta*(1/(1+exp(train_y(i)*w'*train_x(i,:)')))*(train_y(i)*train_x(i,:)');
    end
end
h=1./(1+exp(-test_x*w));
predict(h>0.5)=1;
predict(h<=0.5)=-1;
Eout=sum(test_y~=predict')/N_test