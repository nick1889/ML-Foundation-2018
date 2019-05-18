clc;
clear all;
train_data=load('hw4_train.dat');
test_data=load('hw4_test.dat');
log10_lambda=2:-1:-10;
[N,d]=size(train_data);
N_test=size(test_data,1);
train_x=[ones(N,1),train_data(:,1:d-1)];
train_y=train_data(:,d);
test_x=[ones(N_test,1),test_data(:,1:d-1)];
test_y=test_data(:,d);
k_Ein = 1;
min_Eout = 1;
k_lambda = 0;
for lambda = 10.^(log10_lambda)
w=(train_x'*train_x+lambda*eye(d))\(train_x'*train_y);
p_train=sign(train_x*w);
Ein=sum(p_train~=train_y)/N;
p_test=sign(test_x*w);
Eout=sum(p_test~=test_y)/N_test;
if(min_Eout>Eout)
    k_Ein = Ein;
    min_Eout = Eout;
    k_lambda = lambda;
end
end
    k_lambda,k_Ein,min_Eout