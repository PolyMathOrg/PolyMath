"
This concept describes how to define a ODE that can be solved by an implicit routine. 

Implicit routines need not only the function f(x,t) but also the Jacobian df/dx = A(x,t). 

A is a matrix and implicit routines need to solve the linear problem Ax = b
"
Class {
	#name : #PMImplicitSystem,
	#superclass : #PMODESystem,
	#instVars : [
		'jacobian',
		'dxdt'
	],
	#category : #'Math-ODE'
}

{ #category : #hooks }
PMImplicitSystem >> jacobianAtX: aState t: aTime [
	"calculate and store jacobian at this point df/dx"
	self shouldBeImplemented 
]
