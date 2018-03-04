%% eca: Evolutionary Centers Algorithm
function [xBest, fBest] = eca(fobj, D, N, K, eta_max)

% population size
% N = K*D;
max_evals = 10000*D;
p_exploit = 0.95;
p_bin     = 0.3;

% bounds
a = -100;
b = 100;

Population = a + (b-a)*rand(N, D);

fitness = zeros(1,N);

% evaluate population;
for i = 1:N
	fitness(i) = fobj(Population(i, :));
end

% best solution;
[fBest best_i] = max(fitness);
xBest = Population(best_i, :);

% cueerent number of evaluations;
nevals = N;

% generations;
t = 1;

stopCondition = false;

% main loop;
while ~stopCondition
	I = randperm(N);

	p = nevals / max_evals;
	for i = 1:N
		x = Population(i, :);

		% generate U masses
		if i <= N-K
			U_ids = I(i:K+i);
		else
			U_ids = I(1:K);
		end

		U = Population(U_ids,:);

		% calculate center of mass;
		[c u_worst] = center_of_mass(U, fitness(U_ids));

		% stepsize;
		eta = eta_max * rand;

		% Ask if exploit process should be performed
		if p < p_exploit
			% u: worst element in U
			u = U(u_worst,:);
			% worst-to-center/bin
			y = x + eta * (c - u);

		else
			% center-to-best/bin
			y = x + eta * (xBest - c);
		end

		% y = x + eta*(c - U(u_worst,:));
		y = correctSol(y, a, b);

		for j = 1:D
			if rand < p_bin
				y(j) = c(j);
			end
		end

		fy = fobj(y);
		nevals = nevals + 1;

		if fy > fitness(i)
			[f worst] = min(fitness);
			Population(worst, :) = y;
			fitness(worst) = fy;

			if fy > fBest
				fBest = fy;
				xBest = y;
				% disp(sprintf('%d \t %g\n',  nevals, fBest ));
			end
		end

		stopCondition = nevals >= max_evals;

		if stopCondition
			break;
		end

	end

	t = t + 1;

end

disp(sprintf('===========[ ECA results ]============='));
disp(sprintf('| Evals       = %d', nevals));
disp(sprintf('| Generations = %d', t));
disp(sprintf('| best fitness= %e', fBest));
disp(sprintf('======================================='));