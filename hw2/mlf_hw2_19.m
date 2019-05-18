clc;
clear all;
train_data = load('hw2_train.dat');
N = length(train_data);
d = 9;
train_x = train_data(:,1:d);
train_y = train_data(:,d+1);
derr = zeros(d,1);
thetas = zeros(d,1);
ss = zeros(d,1);
for i = 1:d
    x = train_x(:,i);
    y = train_y;
    max_x = max(x);
    min_x = min(x);
    terr = N;
    ttheta = min_x;
    ts = 0;
    for theta = linspace(min_x,max_x,100)
        h1 = sign(x-theta);
        h2 = -sign(x-theta);
        if sum(h1 ~= y) < terr
            terr = sum(h1 ~= y);
            ttheta = theta;
            ts = 1;
        end
        if sum(h2 ~= y) < terr
            terr = sum(h2 ~= y);
            ttheta = theta;
            ts = -1;
        end
    end
    derr(i) = terr;
    thetas(i) = ttheta;
    ss(i) = ts;
end
index = find(derr==min(derr))
stheta = thetas(index)
fs = ss(index)
Ein = derr(index)/N

test_data = load('hw2_test.dat');
test_x = test_data(:,4);
test_y = test_data(:,d+1);
h = fs*sign(test_x-stheta);
Eout = sum(h ~= test_y)/length(test_data)

