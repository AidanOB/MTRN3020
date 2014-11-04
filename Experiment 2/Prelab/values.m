%Play me big boy
% 
% display('Hello Aidan you sexy creature');
% A = 31688;      % I think this is common
% T = 8/1000;     % This should be common too
% tau = 40/1000;  % This is the Tau you need to put in


% display('CALCULATE');
A = 31688;      % I think this is common
T = 8/1000;     % This should be common too
tau = 38/1000; 
tau_d = tau;

noload;
figure(1); clf; hold on;
A1 = A*24;
t = (0:0.008:0.400);
y = A1*(1-exp(-t/tau));
plot(TEST(:,1)/1000,TEST(:,3), 'r');
plot(t, y, 'b');
xlabel('Time (ms)');
ylabel('Speed (count/s)');
title('Speed vs Time');
legend('Experimental', 'Theoretical', 'Location', 'SouthEast');
set(gcf, 'Color', [1 1 1 ]);
hold off;





num = [24*A];
den = 126*[tau 1 0];
[numd, dend] = c2dm(num,den,T,'zoh');

% display('roots numd');
roots(numd);
% display('roots dend');
roots(dend);
% display('Coeffiecent numd');
% numd
% display('_____above here ^^ THIS IS C =)    ###########################');
% display('_');
% display('Coeffiecent dend');
% dend


p_1 = roots(dend);
p_1 = p_1(2,1)
z_1 = roots(numd)
C = numd(2)

B_0 = ((1-exp((-T)/tau_d))/(1-z_1))

e = exp(-T/tau_d)

Gc = tf((T*B_0/C)*[1 -p_1 0], [1,  -(B_0 + e), B_0 * z_1], T)

% B_1 = (B_0*T)/C
% B_2 = -p_1*B_1
% A_1 = exp((-T)/tau_d) + B_0
% A_2 = -B_0*z_1
% sumA = A_1 + A_2