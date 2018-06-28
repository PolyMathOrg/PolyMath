"
Description

This concept describes how to define a symplectic system written with generalized coordinate q and generalized momentum p:

q'(t) = f(p)

p'(t) = g(q)

Such a situation is typically found for Hamiltonian systems with a separable Hamiltonian:

H(p,q) = Hkin(p) + V(q)

which gives the equations of motion:

q'(t) = dHkin / dp = f(p)

p'(t) = dV / dq = g(q)

The algorithmic implementation of this situation is described by a pair of callable objects for f and g with a specific parameter signature. Such a system should be implemented as a std::pair of functions or a functors. Symplectic systems are used in symplectic steppers like symplectic_rkn_sb3a_mclachlan. 
"
Class {
	#name : #SymplecticSystem,
	#superclass : #ODESystem,
	#instVars : [
		'dqdt',
		'firstBlock',
		'dpdt',
		'secondBlock'
	],
	#category : 'Math-ODE'
}

{ #category : #accessing }
SymplecticSystem >> dpdt [
	^ dpdt
]

{ #category : #accessing }
SymplecticSystem >> dpdt: anObject [
	dpdt := anObject
]

{ #category : #accessing }
SymplecticSystem >> dqdt [
	^ dqdt
]

{ #category : #accessing }
SymplecticSystem >> dqdt: anObject [
	dqdt := anObject
]

{ #category : #evaluation }
SymplecticSystem >> first: pState [ 
	dqdt := firstBlock value: pState.
	^ dqdt.
]

{ #category : #accessing }
SymplecticSystem >> firstBlock [
	^ firstBlock
]

{ #category : #accessing }
SymplecticSystem >> firstBlock: anObject [
	firstBlock := anObject
]

{ #category : #evaluation }
SymplecticSystem >> second: qState [
	dpdt := secondBlock value: qState.
	^ dpdt.
]

{ #category : #accessing }
SymplecticSystem >> secondBlock [
	^ secondBlock
]

{ #category : #accessing }
SymplecticSystem >> secondBlock: anObject [
	secondBlock := anObject
]
