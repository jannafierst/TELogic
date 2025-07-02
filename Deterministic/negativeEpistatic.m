function [u, v, a, b, N_0] = charlesworth(u, v, a, b, N_0)
%ASSUME: 
%     -
%     -

%u = mutation rate
%v = back mutation rate, i.e. gene conversion a la fog-2
%a, b determine the curvature of the fitness function
%N_0 = initial number of TE

n = 20000;
n1 = N_0;

A = [n1];
N1 = n1;
fileID = fopen('negativeEpistatic.txt','w');
for i=1:1:n % here, N is number of generations
    Sn = -a - b*N1;
    delta_n1 = N1 * (Sn + u - v); % assuming a Poisson bc variance is the mean (N1)
    n1 = N1 + delta_n1;
    A = [A; n1];
    N1 = n1;
    fprintf(fileID,'%12.6f\n', N1);
end
