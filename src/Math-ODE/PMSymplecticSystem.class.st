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
	#name : #PMSymplecticSystem,
	#superclass : #PMODESystem,
	#instVars : [
		'dqdt',
		'firstBlock',
		'dpdt',
		'secondBlock'
	],
	#category : #'Math-ODE'
}

{ #category : #accessing }
PMSymplecticSystem >> dpdt [
	^ dpdt
]

{ #category : #accessing }
PMSymplecticSystem >> dpdt: anObject [
	dpdt := anObject
]

{ #category : #accessing }
PMSymplecticSystem >> dqdt [
	^ dqdt
]

{ #category : #accessing }
PMSymplecticSystem >> dqdt: anObject [
	dqdt := anObject
]

{ #category : #evaluation }
PMSymplecticSystem >> first: pState [
	dqdt := firstBlock value: pState.
	^ dqdt
]

{ #category : #accessing }
PMSymplecticSystem >> firstBlock [
	^ firstBlock
]

{ #category : #accessing }
PMSymplecticSystem >> firstBlock: anObject [
	firstBlock := anObject
]

{ #category : #evaluation }
PMSymplecticSystem >> second: qState [
	dpdt := secondBlock value: qState.
	^ dpdt
]

{ #category : #accessing }
PMSymplecticSystem >> secondBlock [
	^ secondBlock
]

{ #category : #accessing }
PMSymplecticSystem >> secondBlock: anObject [
	secondBlock := anObject
]
