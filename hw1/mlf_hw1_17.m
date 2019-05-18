clc;
clear all;
train_data = load('hw1_15_train.dat');
updateTime = 0;
x = [train_data(:,1:4) ones(length(train_data),1)];
y = train_data(:,5);
eta = 0.5;
for time = 1:2000
    rng(time);
    w = zeros(5,1);
    hasMistake = 1;
    j = 0;
    cycle_order = randperm(400);
    while hasMistake ~= 0
        hasMistake = 0;
        for t = cycle_order
            if sign(w'*x(t,:)') ~= y(t) 
                w = w + eta*y(t)*x(t,:)';
                hasMistake = 1;
                j = j + 1;
            end
        end
    end
    j
    updateTime = updateTime + j;
end
averageUpdateTime = updateTime/2000
