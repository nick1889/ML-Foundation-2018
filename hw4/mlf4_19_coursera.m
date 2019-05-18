clc;
clear all;
train_data=load('hw4_train.dat');
test_data=load('hw4_test.dat');
log10_lambda=2:-1:-10;
N_val = 40;
[N_train,d]=size(train_data);
N_test=size(test_data,1);
start_index=1:N_val:N_train;
end_index=start_index+N_val-1;
train_x=[ones(N_train,1),train_data(1:N_train,1:d-1)];
train_y=train_data(1:N_train,d);
test_x=[ones(N_test,1),test_data(:,1:d-1)];
test_y=test_data(:,d);
min_Ecv = 1;
k_lambda = 0;
for lambda = 10.^(log10_lambda)
    Eval = zeros(length(start_index),1);
    for i=1:length(start_index)
        index = 1:N_train;
        val_index = start_index(i):end_index(i);
        train_index = index;
        train_index(val_index)=[];
        val_x = train_x(val_index,:);
        val_y = train_y(val_index);
        batch_x = train_x(train_index,:);
        batch_y = train_y(train_index);
        w=(batch_x'*batch_x+lambda*eye(d))\(batch_x'*batch_y);
        Eval(i) = sum(sign(val_x*w)~=val_y)/N_val;
    end
    Ecv = mean(Eval);
    if(min_Ecv>Ecv)
        min_Ecv = Ecv;
        k_lambda = lambda;
    end
end
k_lambda,min_Ecv
k_w = (train_x'*train_x+k_lambda*eye(d))\(train_x'*train_y);
Ein=sum(sign(train_x*k_w)~=train_y)/N_train
Eout=sum(sign(test_x*k_w)~=test_y)/N_test