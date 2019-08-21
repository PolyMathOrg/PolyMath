"
Another large class of solvers are multi-step method. They save a small part of the history of the solution and compute the next step with the help of this history. Since multistep methods know a part of their history they do not need to compute the system function very often, usually it is only computed once. This makes multistep methods preferable if a call of the system function is expensive. Examples are ODEs defined on networks, where the computation of the interaction is usually where expensive (and might be of order O(N^2)).

Multistep methods differ from the normal steppers. They safe a part of their history and this part has to be explicitly calculated and initialized. In the following example an Adams-Bashforth-stepper with a history of 5 steps is instantiated and initialized; 

The initialization uses a fourth-order Runge-Kutta stepper and after the call of initialize the state of inout has changed to the current state, such that can be immediately used by passing it to following calls of do_step. Of course, you can also use you own steppers to initialize the internal state of the Adams-Bashforth-Stepper: 

Many multistep methods are also explicit steppers, hence the parameter of do_step method do not differ from the explicit steppers. 
"
Class {
	#name : #PMMultiStepper,
	#superclass : #PMStepper,
	#category : #'Math-ODE'
}
