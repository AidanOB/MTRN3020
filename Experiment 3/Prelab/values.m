function values()
clc(); clear()
format long

ROT335;

figure(1);clf; hold on;
plot(TEST(:,1)/1000, TEST(:,3), 'b');

A = max(TEST(:,3));
A/24
tau = TEST(max(find(TEST(1:250,3) < max(TEST(:,3)) *(2/3))),1)/1000
t = 0:0.005:1.5;
y_theoretical = A*(1-exp(-t/tau));
plot(t, y_theoretical, 'r');
xlabel('Time (ms)');
ylabel('Speed (count/s)');
title('Speed vs Time');
legend('Experimental', 'Theoretical');
hold off;

taud = 0.048
A = (A/24) * (2*pi)/8192

T = 0.008;
% tau = 0.110;

%Test with known solutions
% A = 8.94822;
% tau = 0.105;
% T = 0.006;
% taud = 0.032;





%---------------------------------------------------

numGs = [A];
denGs = [tau 1 0];
[numGz, denGz] = c2dm(numGs, denGs, T, 'zoh');
Gz = tf(numGz, denGz, T)

z1=roots(numGz);
p1 = denGz(3);
C = numGz(2)/T;

pD = exp(-T/taud);
b0 = (1-pD)/(1-z1)

numGc = (b0/C) * [1 -p1 0]
denGc = [1 -(pD+b0) b0*z1]
Gc = tf(numGc, denGc, T)

syms K;
numGp2 = (2*b0*T/34.8)*[1 -z1];
denGp2 = [1 (-1-pD) pD];
Gp2 = tf(numGp2, denGp2, T);

figure(2); clf();
grid on;
rlocus(Gp2)

ln(0.919)

end