"
An ExplicitInverseCongruentialGenerator is an explicit inversive congruential generator, constructed according to ""Good random number generators are (not so) easy to find"" by P. Hellekalek (1998) and extended euclidean algorithm.
Developed by Konstantin Nizheradze <konsnizher@gmail.com> 

Instance Variables
	nextN:		<Object>
	nextValue:		<Object>
	p:		<Object>

nextN
	- next number of the sequence of random numbers. It is also the parameter at extended euclidean algorythm

nextValue
	- next modulo inverse value, calculated by extended euclidean algorythm

p
	- parameter at extended euclidean algorythm

"
Class {
	#name : #PMExplicitInverseCongruentialRandomGenerator,
	#superclass : #Random,
	#instVars : [
		'p',
		'nextN',
		'nextValue',
		'nextModInv'
	],
	#category : 'Math-Random'
}

{ #category : #initialization }
PMExplicitInverseCongruentialRandomGenerator >> initialize [
	"Initialize using Random and define the modulo (p)"

	| random |
	super initialize.
	p := 16r7FFFFFFF asFloat.
	random := Random new.
	nextN := random nextValue.
	
]

{ #category : #accessing }
PMExplicitInverseCongruentialRandomGenerator >> next [
	"This method is used by nextInt:, answer a random Float in the interval [0 to 1]"
		
	nextModInv := self nextRandomValue / p.
 	 ^ nextModInv
	
	  
	
]

{ #category : #private }
PMExplicitInverseCongruentialRandomGenerator >> nextRandomValue [
	"Calculate the next modulo inverse value for n+1"

	| rem newrem inv newinv transrem transinv quotient |
	inv := 0.
	newinv := 1.
	rem := p.
	newrem := nextN.
	[newrem ~= 0] whileTrue: [quotient := rem // newrem.
								transrem := newrem.
								newrem := rem \\ newrem.
								rem := transrem.
								transinv := newinv.
								newinv := inv - (quotient * newinv).
								inv := transinv].
	(inv < 0) ifTrue: [inv := inv + p].						
	nextValue := inv.
	nextN := nextN + 1.
	^nextValue
	
]

{ #category : #tests }
PMExplicitInverseCongruentialRandomGenerator >> testNextValue: anInteger [
	"This is to test the principle of modulo inverse"

	| rem newrem inv newinv transrem transinv quotient |
	inv := 0.
	newinv := 1.
	rem := 240.
	newrem := anInteger.
	[newrem ~= 0] whileTrue: [quotient := rem // newrem.
								transrem := newrem.
								newrem := rem \\ newrem.
								rem := transrem.
								transinv := newinv.
								newinv := inv - (quotient * newinv).
								inv := transinv].
	^ inv
	
]
