"
A vector is an object in a multidimensional space. It is represented by its components measured on a reference system.

Here is a typical use of myself

[[[ 
| u v w a b c |
u := #(1 2 3) asPMVector.
v := #(3 4 5) asPMVector.
a := PMMatrix rows: #( ( 1 0 1 ) (-1 -2 3)).
b := PMMatrix rows: #( ( 1 2 3 ) (-2 1 7) (5 6 7)).
w := 4 * u + (3 * v).
c := a * b.
v := a * u.
w := c transpose * v.
w := v * c.
]]]
"
Class {
	#name : #PMVector,
	#superclass : #Array,
	#type : #variable,
	#category : #'Math-Core'
}

{ #category : #'instance creation' }
PMVector class >> new: size random: maxRandomNumber [ 
	"Answer an instance of me, with number of elements equal to size, each 
	a randomNumber lower than maxRandomNumber ."

	^self newFrom:  ( (1 to: size ) collect: [:e|maxRandomNumber random ]  )
]

{ #category : #private }
PMVector class >> ones: anInteger [
	"Creates a vector of ones."
	|a|
	a := PMVector new: anInteger.
	1 to: a size do: [ :n | a at: n put: 1].
	^a
]

{ #category : #private }
PMVector class >> randomSize: anInteger maxNumber: aMaxNumber [
	"Creates a vector of rand numbers from 0 to aMaxNumber."
	|a|
	a := PMVector new: anInteger.
	1 to: a size do: [ :n | a at: n put: (aMaxNumber random)].
	^a
]

{ #category : #private }
PMVector class >> zeros: anInteger [
	"Creates a vector of zeros."
	|a|
	a := PMVector new: anInteger.
	1 to: a size do: [ :n | a at: n put: 0].
	^a
]

{ #category : #operation }
PMVector >> * aNumberaVectoraMatrix [
	^ aNumberaVectoraMatrix productWithVector: self
]

{ #category : #operation }
PMVector >> + aVectorOrNumber [
	"Answers the sum of the receiver with a vector or number."
	^ aVectorOrNumber addWithVector: self
]

{ #category : #operation }
PMVector >> - aVectorOrNumber [
	"Answers the difference of the receiver with a vector or number."
	^ -1*aVectorOrNumber addWithVector: self
]

{ #category : #operation }
PMVector >> < aNumber [
	"Apply < operator to every element of a vector and returns a new vector"
	^ ((1 to: self size) collect: [ :n | (self at: n) < aNumber]) asPMVector.
]

{ #category : #operation }
PMVector >> > aNumber [
	"Apply > function to every element of a vector and return a new vector"
	^ ((1 to: self size) collect: [ :n | (self at: n) > aNumber]) asPMVector.
]

{ #category : #transformation }
PMVector >> accumulate: aVectorOrAnArray [
	"Modify the receiver adding the contents of the argument to the receiver."
	1 to: self size do: [ :n | self at: n put: ((self at: n) + (aVectorOrAnArray at: n))].
]

{ #category : #transformation }
PMVector >> accumulateNegated: aVectorOrAnArray [
	"Modify the receiver adding the negated contents of the argument to the receiver."
	1 to: self size do: [ :n | self at: n put: ((self at: n) - (aVectorOrAnArray at: n))].
]

{ #category : #'as yet unclassified' }
PMVector >> argMax [
	| a |
	a := self asArray.
	^ a indexOf: a max
]

{ #category : #converting }
PMVector >> asArray [
	
	| array i|
	array := Array new: self size.
	i := 0.
	self do: [:item | array basicAt: (i:=i+1) put: item].
	^ array
]

{ #category : #creation }
PMVector >> asPMVector [
	"Answer self since the receiver is a vector."
	^ self
]

{ #category : #'as yet unclassified' }
PMVector >> checkDimensionalCompatibility: dimensionArray [
	|prod|
	prod := 1.
	
	dimensionArray do: [ :each | prod := prod * each ].
	
	self assert: (self size = prod) description: 'Imcompatible combination of Dimensions provided'.
	
	^true 
]

{ #category : #comparing }
PMVector >> closeTo: aPMVector [
	"Compare two vectors using the default precision from Float >> #closeTo:."

	^ self closeTo: aPMVector precision: 0.0001.
]

{ #category : #comparing }
PMVector >> closeTo: aPMVector precision: aPrecision [
	"Tests whether the total summed difference between self and aPMVector is within aPrecision."

	^ (self - aPMVector) abs sum < aPrecision
]

{ #category : #operation }
PMVector >> cos [
	"Apply cos function to every element of a vector"
	1 to: self size do: [ :n | self at: n put: (self at: n) cos].
]

{ #category : #operation }
PMVector >> cosh [
	"Apply cosh function to every element of a vector"
	1 to: self size do: [ :n | self at: n put: (self at: n) cosh].
]

{ #category : #transformation }
PMVector >> cumsum [
	"Cumulative sum
	#(1 2 3 4 5) cumsum = #(1 3 6 10 15)
	"
   | sum |
	sum := 0.
	^ self collect: [ :v | sum := sum + v. sum ]
 
]

{ #category : #operation }
PMVector >> hadamardProduct: aVector [
	"Answers the elementwise product of the receiver with aVector."

	| answer n |
	answer := self class new: self size.
	n := 0.
	self
		with: aVector
		do: [ :a :b | 
			n := n + 1.
			answer at: n put: a * b ].
	^ answer
]

{ #category : #'as yet unclassified' }
PMVector >> householder [
	"returns a collection of the skalar beta and the housholder vector"
	|s v b u x |
	s :=self allButFirst.
	s := s *s.
	v := self copy.
	v at: 1 put: 1.  
	s = 0 
		ifTrue: [ b :=0 ] 
		ifFalse: [
			u :=((x:=self at:1)squared + s)sqrt .
			v 
				at: 1 
				put: ((x <=0) ifTrue: [x -u] ifFalse:  [0 - s / (x + u)]).
			b :=(v at: 1) squared * 2 / (s + (v at: 1) squared).
			v := v / (v at: 1) ].
	^Array with: b with: v
]

{ #category : #testing }
PMVector >> isReal [
	"Answer true if all values of the vector are real numbers"
	^ self allSatisfy: [ :each | each isRealNumber ].
]

{ #category : #operation }
PMVector >> log [
	"Apply log function to every element of a vector"
	1 to: self size do: [ :n | self at: n put: (self at: n) log].
]

{ #category : #transformation }
PMVector >> negate [
	"Inverse the sign of all components of the receiver."
	1 to: self size do: [ :n | self at: n put: (self at: n) negated].
]

{ #category : #operation }
PMVector >> negated [
	^ self * -1
]

{ #category : #operation }
PMVector >> norm [
	"Answer the norm of the receiver."
	^(self * self) sqrt
]

{ #category : #creation }
PMVector >> normalized [
	^ (1 / self norm) * self
]

{ #category : #operation }
PMVector >> productWithMatrix: aMatrix [
	"Answers the product of aMatrix with the receiver."
	^aMatrix rowsCollect: [ :each | each * self]
]

{ #category : #operation }
PMVector >> productWithVector: aVector [
	"Answers the scalar product of aVector with the receiver."
	| n |
	n := 0.
	^self inject: 0
			into: [ :sum :each | n := n + 1. (aVector at: n) * each + sum]
]

{ #category : #'as yet unclassified' }
PMVector >> reshapeWithDimensions: dimensionArray [
	| computedRows rowNum colNum |
	self checkDimensionalCompatibility: dimensionArray.
	rowNum := dimensionArray at: 1.
	colNum := dimensionArray at: 2.
	computedRows := ((1 to: rowNum) collect: [ :i | (1 to: colNum) collect: [ :j | self at: (i-1*colNum)+j ] ]).
	
	^PMMatrix rows: computedRows
]

{ #category : #operation }
PMVector >> scalarProduct: aVector [
	
	| product n |
	n := 0.
	product := self collect: [ :each | n := n + 1. (aVector at: n) * each].
	n := product size.
	[ n > 1]
		whileTrue:[ | i j|
					i := 1.
					j := n.
					[ i < j]
						whileTrue: [ product at: i put: ( product at: i) + ( product at: j).
									 j := j - 1.
									 i := i + 1.
								   ].
					n := i min: j.
				  ].
	^product at: 1
]

{ #category : #transformation }
PMVector >> scaleBy: aNumber [
	"Modify the receiver elements by a multiplicating factor."
	1 to: self size do: [ :n | self at: n put: ((self at: n) * aNumber)].
]

{ #category : #operation }
PMVector >> sin [
	"Apply sin function to every element of a vector"

	1 to: self size do: [ :n | self at: n put: (self at: n) sin ]
]

{ #category : #operation }
PMVector >> sinh [
	"Apply sinh function to every element of a vector"

	1 to: self size do: [ :n | self at: n put: (self at: n) sinh ]
]

{ #category : #operation }
PMVector >> sqrt [
	"Apply sqrt function to every element of a vector"

	1 to: self size do: [ :n | self at: n put: (self at: n) sqrt ]
]

{ #category : #arithmetic }
PMVector >> take: anInteger [

	" Answer a <Collection> with the receiver's binomial coefficient at each element for anInteger "

	^ self collect: [ :each | each numberOfCombinationsTaken: anInteger ]
]

{ #category : #operation }
PMVector >> tan [
	"Apply tan function to every element of a vector"

	1 to: self size do: [ :n | self at: n put: (self at: n) tan ]
]

{ #category : #operation }
PMVector >> tanh [
	"Apply tanh function to every element of a vector"

	^ self collect: [ :each | each tanh ]
]
