clc;
clear all;
train_data = load('hw1_18_train.dat');
test_data = load('hw1_18_test.dat');
updateTime = 0;
x = [train_data(:,1:4) ones(length(train_data),1)];
y = train_data(:,5);
x_test = [test_data(:,1:4) ones(length(test_data),1)];
y_test = test_data(:,5);
errorRate = zeros(length(x_test),1);
for time = 1:2000
    time
    rng(time);
    w = zeros(5,1);
    w_pocket = zeros(5,1);
    mistake = length(train_data);
    j = 0;
    while j < 100
        for t = randperm(length(x))
            if sign(w'*x(t,:)') ~= y(t) 
                w = w + y(t)*x(t,:)';
                j = j + 1;
                break;
            end
        end
        for k = 1:length(x)
            if sum(sign(w'*x') ~= y' ) < mistake
                mistake = sum(sign(w'*x') ~= y' );
                w_pocket = w;
            end
        end
    end
     errorRate(time)=sum(sign(w_pocket'*x_test') ~= y_test' )/length(x_test);
end
averageErrorRate = mean(errorRate)