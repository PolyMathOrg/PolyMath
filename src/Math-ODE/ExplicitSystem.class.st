"
Rather than passing dxdt as a reference to be modified, we will ask the system x:t: and expect reply dxdt. This may be a single value or a vector of values.

From ODEINT-V2:
System functions

Up to now, we have nothing said about the system function. This function depends on the stepper. For the explicit Runge-Kutta steppers this function can be a simple callable object hence a simple (global) C-function or a functor. The parameter syntax is sys( x , dxdt , t ) and it is assumed that it calculates dx/dt = f(x,t).

Other types of system function represent Hamiltonian systems or system which also compute the Jacobian needed in implicit steppers. For informations which stepper uses which system function see the stepper table below. It might be possible, that odeint will introduce new system types in near future. Since the system function is strongly related to the stepper type, such an introduction of a new stepper might result in a new type of system function.

"
Class {
	#name : #ExplicitSystem,
	#superclass : #ODESystem,
	#category : 'Math-ODE'
}
