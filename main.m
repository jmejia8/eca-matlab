close all
clear all


D = 10;
K = 7;
N = 2*K*D;
eta_max = 4;

xGlobal = pi*ones(1, D)

% fitness = @(x) -sum((x - xGlobal).^2);
fitness = @(x) -sum((x - xGlobal).^2-10*cos(2*pi.*(x - xGlobal)))-10*length(x);

[x f] = eca(fitness, D, N, K, eta_max);
x