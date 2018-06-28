"
In most Hamiltonian systems the kinetic term is a quadratic term in the momentum Hkin = p^2 / 2m and in many cases it is possible to rescale coordinates and set m=1 which leads to a trivial equation of motion:

q'(t) = f(p) = p.

while for p' we still have the general form

p'(t) = g(q)

As this case is very frequent we introduced a concept where only the nontrivial equation for p' has to be provided to the symplectic stepper. We call this concept Simple_Symplectic_System

"
Class {
	#name : #SimpleSymplecticSystem,
	#superclass : #SymplecticSystem,
	#category : 'Math-ODE'
}
