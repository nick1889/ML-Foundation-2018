train_data = load('hw1_15_train.dat');
x = [train_data(:,1:4) ones(length(train_data),1)];
y = train_data(:,5);
w = zeros(5,1);
hasMistake = 1;
j = 0;
while hasMistake ~= 0
    hasMistake = 0;
    for t = 1:length(x)
        if sign(w'*x(t,:)'-1) ~= y(t) 
            w = w + y(t)*x(t,:)';
            hasMistake = 1;
            j = j + 1;
        end 
    end
end
j