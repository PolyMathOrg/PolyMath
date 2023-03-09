"
Permutation is an Array, that - if it's reduced - consists of the numbers from (1 to: self size) in the original order.
example:
Permutation ordering: #(5 4 1). -> a Permutation(3 2 1)

you can think of a permutation as a positioning specification for a SequentialCollection.
another example:
a:=Permutation randomPermutation: 4. -> a Permutation(1 4 2 3)
a permute: #(a b cd e). -> #(#a #e #b #cd)
yet another one: 
Permutation ordering: #(a e b cd). ""a Permutation(1 4 2 3)""
 

"
Class {
	#name : #PMPermutation,
	#superclass : #Array,
	#type : #variable,
	#classVars : [
		'RandomGenerator'
	],
	#category : #'Math-Permutation'
}

{ #category : #accessing }
PMPermutation class >> allOfSize: anInteger [
	"generates all permutations of the given size, in other words it produces the symmetric group of degree anInteger.
Heap's algorithm, used here, seems to be just a tiny bit faster than using #permutationsDo:"

	| result perm c i ci |
	anInteger = 0 ifTrue: [ ^ #(  ) ].
	perm := self identity: anInteger.
	(result := WriteStream on: (Array new: anInteger factorial)) nextPut: perm copy.
	c := Array new: anInteger withAll: 1.
	i := 1.
	[ i <= anInteger ] whileTrue: [
		i := (ci := c at: i) < i
			     ifTrue: [
				     i odd
					     ifTrue: [ perm swap: 1 with: i ]
					     ifFalse: [ perm swap: ci with: i ].
				     result nextPut: perm copy.
				     c at: i put: ci + 1.
				     1 ]
			     ifFalse: [
				     c at: i put: 1.
				     i + 1 ] ].
	^ result contents
]

{ #category : #'instance creation' }
PMPermutation class >> fromCycles: aCollectionofCollections [

	| length |
	length := aCollectionofCollections flattened.
	length := length ifEmpty: [ 0 ] ifNotEmpty: [ length max ].
	^ self size: length fromCycles: aCollectionofCollections
]

{ #category : #accessing }
PMPermutation class >> generator: arrayOfPermutations [

	| f max generators |
	max := (arrayOfPermutations collect: [ :g | g size ]) max.
	generators := arrayOfPermutations collect: [ :g | g extendTo: max ].
	f := PMFixpoint
		     block: [ :s |
			     | aSet |
			     aSet := Set newFrom: s.
			     s do: [ :p | s do: [ :q | aSet add: (p permute: q) ] ].
			     aSet ]
		     value: generators.
	f verbose: false.
	^ f evaluate asArray
]

{ #category : #'instance creation' }
PMPermutation class >> identity: size [
^ super withAll: (1 to: size) 
]

{ #category : #'instance creation' }
PMPermutation class >> newFrom: aCollection [
"returns the unreduced form, for a reduced form use #ordering:.
uses super withAll: since this way a primitive can be used, which is generally much faster than super newFrom:"
^( super withAll:  aCollection )
]

{ #category : #'instance creation' }
PMPermutation class >> ordering: aCollection [
	"use #newFrom: for an unreduced Permutation! but then most things won't work before you call #reduce.
aCollection must consist of elements that can be sorted via #<="

	^ (super withAll: aCollection) reduce
]

{ #category : #accessing }
PMPermutation class >> randomGenerator [

	^ RandomGenerator ifNil: [ RandomGenerator := Random new ]
]

{ #category : #accessing }
PMPermutation class >> randomGenerator: aGenerator [

	^ RandomGenerator := aGenerator
]

{ #category : #'instance creation' }
PMPermutation class >> randomPermutation: size [

	^ self newFrom: ((1 to: size) asArray shuffleBy: self randomGenerator)
]

{ #category : #'instance creation' }
PMPermutation class >> size: anInteger fromCycles: aCollectionofCollections [
	| result |
	result := self identity: anInteger.
	aCollectionofCollections do: [ :cycle | 
		1 to: cycle size do: [ :i | 
			result at: (cycle at: i) put: (cycle atWrap: i + 1) ] ].
	^ result
]

{ #category : #'instance creation' }
PMPermutation class >> size: size shift: aNumber [
"number positive -> leftshift, negative -> rightshift"
^ (super withAll: (1 to: size) )shift: aNumber
]

{ #category : #accessing }
PMPermutation class >> stirling1:anInteger over:anotherInteger [
"unsigned Stirling number of the first kind: the number of permutations of size anInteger with anotherInteger number of cycles"
|block|
block:=[:nandk||n k|
	n:=nandk first.
	k:=nandk second.
	(n=k and:[n isZero])
		ifTrue:[1]
		ifFalse:[	(n * k) isZero 
			ifTrue:[0]
			ifFalse:[ (block value: (Array with: n-1 with: k-1))+((n-1)*(block value:(Array with: n-1 with: k)))]]]memoized .
^block value: (Array with: anInteger with: anotherInteger)
]

{ #category : #converting }
PMPermutation >> asCycles [
	| unused start next result cycle |
	unused := (1 to: self size) asOrderedCollection.
	result := OrderedCollection new.
	[ unused isEmpty ]
		whileFalse: [ 
			next := start := unused first.
			cycle := OrderedCollection new.
			[ cycle add: (unused remove: next).
			next := self at: next ] doWhileFalse: [ next = start ].
			result add: cycle asArray ].
	^ result asArray
]

{ #category : #converting }
PMPermutation >> asMatrix [
	^ PMMatrix
		rows:
		  (self asPMVector
				collect: [ :n | 
					(PMVector new: self size)
						atAllPut: 0;
						at: n put: 1;
						yourself ])
]

{ #category : #applying }
PMPermutation >> discriminant [
^self size - self asCycles size
]

{ #category : #testing }
PMPermutation >> even [ 
^self odd not
]

{ #category : #applying }
PMPermutation >> extendTo: size [
	| c |
	size=self size ifTrue: [ ^self copy ].
	c := self class identity: size.
	c
		replaceFrom: 1
		to: self size
		with: self
		startingAt: 1.
	^ c
]

{ #category : #applying }
PMPermutation >> inverse [
|c|
c:=self class new:self size.
1 to: self size do: [:i | c at: i put: (self indexOf: i)].
^c
]

{ #category : #testing }
PMPermutation >> isCollection [
"pffh, i found this useful, but i dont remember anymore why."
	^ false
]

{ #category : #testing }
PMPermutation >> odd [
"using the number of transpositions is faster than using the number of inversions"
^self discriminant odd.
]

{ #category : #applying }
PMPermutation >> permute: aSequentialCollection [

	| s c |
	(s := aSequentialCollection size) < self size ifTrue: [
		^ aSequentialCollection class == self class
			  ifTrue: [ self permute: (aSequentialCollection extendTo: self size) ]
			  ifFalse: [ SizeMismatch signal ] ].
	c := aSequentialCollection copy.
	1 to: self size do: [ :i | c at: i put: (aSequentialCollection at: (self at: i)) ].
	^ c
]

{ #category : #private }
PMPermutation >> reduce [
"automatically used only in #withAll: so far"
	| sorted range |
	(sorted := self sorted) = (range := 1 to: self size)
		ifTrue: [ ^ self ].
	self size = self asSet size
		ifFalse: [ ^ self error: 'Permutation has doubles' ].
	range do: [ :n | self at: n put: (sorted indexOf: (self at: n)) ]
]

{ #category : #converting }
PMPermutation >> reversed [
	"copy of SequenceableCollection>>reversed, but uses class instead of species."
	| n result src |
	n := self size.
	result := self class new: n.
	src := n + 1.
	1 to: n do: [:i | result at: i put: (self at: (src := src - 1))].
	^ result
]

{ #category : #converting }
PMPermutation >> shift: anInteger [
"number positive -> leftshift, negative -> rightshift.
 does _not_ return a new Permutation!"
	| n c |
	self ifEmpty: [ ^ self ].
	n := anInteger \\ self size.
	c := self copy.
	self
		replaceFrom: 1 to: self size - n with: c startingAt: n + 1;
		replaceFrom: self size - n + 1 to: self size with: c startingAt: 1
]

{ #category : #private }
PMPermutation >> species [
	^ Array 
]
