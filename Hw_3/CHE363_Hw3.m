% Kishan Ramachandran
% September 2018
% 
% CHE 363
% Hw 3

% CONCLUSIONS:
% We are able to replicate the experimental graph with our ode pretty well
% Our graph is much more clean as it doesn't have any experimental noise
% We also don't see an inverse response since we are using the model and
% not experimental data


% CODE:

% Number of cycles
N = 4095;

% Cout
Cout = 1.41;
% Cin
Cin = 0.45;

% Set valve opening at intervals of 500s
Pv(1:500) = 91.62;
Pv(501:1000) = 76.58;
Pv(1001:1500) = 67.25;
Pv(1501:2000) = 58.07;
Pv(2001:2500) = 48.84;
Pv(2501:3000) = 41.27;
Pv(3001:3500) = 33.82;
Pv(3501:4000) = 26.01;
Pv(4001:4500) = 18.56;

% Set time from 1 to 4500
t = [1 4500];
tspan = [1:4500];

% Guess initial h value of 8
h0 = 8;

% Solve ode
[t,h] = ode45(@(t,h) ode(t,Pv,h,Cin,Cout,tspan),t,h0);

%Plots
title("Level and valve inputs");
xlabel("time [s]");
yyaxis left
plot(t,h);
yyaxis right
plot(tspan,Pv);

% Define ode
function dhdt = ode(t,Pv,h,Cin,Cout,tarr)
Pvint = interp1(tarr,Pv,t);
dhdt(1) = (Cin*sqrt(Pvint))-(Cout*sqrt(h));
end



