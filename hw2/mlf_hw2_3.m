x = -10:0.01:10;
alpha = 1;
h = sign(abs(mod(alpha*x,4)-2)-1);
plot(x,h),axis([-10,10,-2,2])