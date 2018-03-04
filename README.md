# Evolutionary Centers Algorithm: MATLAB Version

ECA is a physics-inspired algorithm based on the center of mass concept on 
a D-dimensional space for real-parameter single-objective optimization. The 
general idea is to promote the creation of an irregular body using K mass points
in the current population, then the center of mass is calculated to get a new direction 
for the next population... [read more.](https://www.dropbox.com/s/kqc22ki2edjtt0y/ECA-optimization.pdf)

## Files / Functions

* `main.m`: Usage example
* `eca.m` : ECA function with parameters
	* `fobj`: Objective function
	* `D`: Problem dimension (design variables)
	* `K`: K-masses for generating center of mass
	* `N`: Population size (K = 2KD is suggested)
	* `eta_max`: Stepsize
* `center_of_mass.m`: Calculate the center of mass
* `correctSol.m`: Retrieve errant solutions

