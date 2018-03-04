%% center_of_mass: center of mass
function [c worst] = center_of_mass(positions, mass)
[N D] = size(positions);

[m worst] = min(mass);

% for negative masses
if m < 0
	mass = 2*abs(m) + mass;
end

c = zeros(1, D);
for i = 1:N
	c = c + mass(i) * positions(i,:);
end

c = c / sum(mass);