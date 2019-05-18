clc;
clear all;
N = 10000;
dvc = 50;
delta = 0.05;
y_ovc = sqrt(8/N*log(4*(2*N)^dvc/delta))
y_rpb = sqrt(2*log(2*N*N^dvc)/N)+sqrt(2/N*log(1/delta))+1/N
y_pvb = solve('x=sqrt(1/10000*(2*x+log(6*(2*10000)^50/0.05)))','x')
y_dev = solve('x=sqrt(1/(2*10000)*( (4*x*(1+x) )+log(4*(10000^2^50)/0.05)))','x')
y_vvc = sqrt(16/N*log(2*N^dvc/sqrt(delta)))
