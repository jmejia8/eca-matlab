%% correctSol: correct solution
function [y] = correctSol(x, a, b)
y = x;
for i = 1:length(x)
	if x(i) < a | x(i) > b
		y(i) = a + (b - a)*rand;
	end
end
