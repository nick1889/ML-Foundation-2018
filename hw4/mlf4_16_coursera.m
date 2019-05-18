clc;
clear all;
train_data=load('hw4_train.dat');
test_data=load('hw4_test.dat');
log10_lambda=2:-1:-10;
N_train = 120;
N_val = 80;
[N,d]=size(train_data);
N_test=size(test_data,1);
train_x=[ones(N_train,1),train_data(1:N_train,1:d-1)];
train_y=train_data(1:N_train,d);
val_x=[ones(N_val,1),train_data(N_train+1:N,1:d-1)];
val_y=train_data(N_train+1:N,d);
test_x=[ones(N_test,1),test_data(:,1:d-1)];
test_y=test_data(:,d);
min_Ein = 1;
k_Eout = 1;
k_lambda = 0;
k_w=zeros(d,1);
for lambda = 10.^(log10_lambda)
w=(train_x'*train_x+lambda*eye(d))\(train_x'*train_y);
p_train=sign(train_x*w);
Ein=sum(p_train~=train_y)/N_train;
p_test=sign(test_x*w);
Eout=sum(p_test~=test_y)/N_test;
if(min_Ein>Ein)
    min_Ein = Ein;
    k_Eout = Eout;
    k_lambda = lambda;
    k_w=w;
end
end
k_lambda,min_Ein,k_Eout
Eval = sum(sign(val_x*k_w)~=val_y)/N_val