clc;
clear all;
N = 20;
Eout = 1;
for theta=linspace(1,-1,N)
        if 0.5+0.3*(abs(theta)-1) < Eout
            Eout = 0.5+0.3*(abs(theta)-1);
        end
end
Eout