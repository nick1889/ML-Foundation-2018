clc;
clear all;
trail = 1000;
err = zeros(trail,1);
N = 20;
for t = 1:trail
    x = -1 + 2* rand(N,1);
    s = sign(x);
    f = s;
    i = rand(N,1)<0.2;
    f(i) = -1*f(i);
    terr = N;
    for theta = linspace(1,-1,20)
        h1 = sign(x-theta);
        h2 = -sign(x-theta);
        if sum(h1 ~= f)<terr
            terr = sum(h1 ~= f);
        end
        if sum(h2 ~= f)<terr
            terr = sum(h2 ~= f);
        end
    end
    err(t) = terr;
end
finalerr = mean(err)/N

