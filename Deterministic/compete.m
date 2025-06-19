function [u1, u2, v, a1, a2, s, m12, m21, N1_0, N2_0] = symmetric(u1, u2, v, a1, a2, s, m12, m21, N1_0, N2_0)
%ASSUME: 
%     -
%     -

%u1 = transposition rate of element 1 (autonomous)
%u2 = transposition rate of element 2 (nonautonomous)
%v = deletion/excision rate
%a1 = activity of element 1 (autonomous)
%a2 = activity of element 2 (nonautonomous)
%s = additive fitness, generally < 0
%N1_0 = number of copies of element 1
%N2_0 = number of copies of element 2


% with 2 transposable elements, element 1 autonomous and element 2

n = 5000;
n1 = N1_0;
n2 = N2_0;

A = [n1 n2];
N1 = n1;
N2 = n2;
fileID = fopen('Symmetric.txt','w');
for i=1:1:n % here, N is number of generations
    Sn = s/((N1+N2)*s + 1);
    abar = (N1*a1 + N2*a2)/(N1+N2);
    delta_n1 = N1 * (Sn + ((1 - exp(-N2))*abar + exp(-N2)*a1)*u1 - v) - N1*m12 + N2*m21;
    delta_n2 = N2 * (Sn + ((1 - exp(-N1))*abar + exp(-N1)*a2)*u2 - v) - N2*m21 + N1*m12;
    n1 = N1 + delta_n1;
    n2 = N2 + delta_n2;
    A = [A; n1 n2];
    N1 = n1;
    N2 = n2;
    fprintf(fileID,'%12.6f\t%12.6f\n', N1, N2);
end

%%
%plots
figure(1)
plot(A, 'linewidth', 2);
T=title('Trajectory');
set(T, 'FontSize', 20)
x=xlabel('Generations');
set(x, 'FontSize', 20);
xticks([0 n/2 n]);
y=ylabel('Frequency');
yticks([0 500 1000]);
set(y, 'FontSize', 20);
l=legend('Element 1', 'Element 2');
set(l, 'FontSize', 18);
set(gca, 'FontSize', 18);
ylim([0 1000]);
xlim([0 n]);

end

