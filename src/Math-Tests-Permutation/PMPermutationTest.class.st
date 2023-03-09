Class {
	#name : #PMPermutationTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Permutation'
}

{ #category : #'class tests' }
PMPermutationTest >> testAllOfSize [

	| p "i	w" |
	"special"
	self assert: (PMPermutation allOfSize: 0) equals: #(  ).
	self assert: (PMPermutation allOfSize: 1) equals: (Array with: (PMPermutation identity: 1)).
	"odd"
	p := PMPermutation allOfSize: 3.
	self assert: p size equals: 3 factorial.
	self assert: p asSet size equals: 3 factorial.
	p do: [ :per |
		self assert: per size equals: 3.
		self assert: per class identicalTo: PMPermutation ].
	"even"
	p := PMPermutation allOfSize: 4.
	self assert: p size equals: 4 factorial.
	self assert: p asSet size equals: 4 factorial.
	p do: [ :per | "the following speed-test is indeed randomized and will occasionally fail!therefore it is put into comments, but it is important nevertheless, as, if this last #assert: is not true mostly, one can simplify #allOfSize: this way:
Permutation class>>allOfSize:anInteger
	|result|
	(result := WriteStream on:(Array new: anInteger factorial)).
	(Permutation identity: anInteger) permutationsDo: [:p|result nextPut: p copy].
	^result contents""Smalltalk garbageCollect. Smalltalk garbageCollect.
i := [Permutation allOfSize: 9] timeToRun.
w:=WriteStream on: ( Array new: 9 factorial ).
Smalltalk garbageCollect. Smalltalk garbageCollect.
p := [(Permutation identity: 9) permutationsDo: [:each | w nextPut: each copy]] timeToRun.
w:=nil.
self assert: i < p."
		self assert: per size equals: 4.
		self assert: per class identicalTo: PMPermutation ]
]

{ #category : #tests }
PMPermutationTest >> testAsCycles [

	self assertEmpty: PMPermutation new asCycles.
	self assert: (PMPermutation identity: 1) asCycles equals: #( #( 1 ) ).
	self assert: (PMPermutation identity: 3) asCycles equals: #( #( 1 ) #( 2 ) #( 3 ) ).
	self assert: (PMPermutation ordering: #( 3 1 4 2 )) asCycles equals: #( #( 1 3 4 2 ) ).
	self assert: (PMPermutation ordering: #( 2 4 3 6 7 8 5 1 )) asCycles equals: #( #( 1 2 4 6 8 ) #( 3 ) #( 5 7 ) ).
	self assert: (PMPermutation ordering: #( 5 4 2 3 1 )) asCycles equals: #( #( 1 5 ) #( 2 4 3 ) ).
	self assert: (PMPermutation ordering: #( 1 2 5 3 4 6 )) asCycles equals: #( #( 1 ) #( 2 ) #( 3 5 4 ) #( 6 ) )
]

{ #category : #tests }
PMPermutationTest >> testAsMatrix [
|p|
p:=(PMPermutation newFrom: #(4 2 5 3 1)).
self assert: p asMatrix * (PMPermutation identity: 5)asPMVector
	equals: p asPMVector.
self assert: p inverse asMatrix * p asPMVector
	equals: (PMPermutation identity: 5) asPMVector
]

{ #category : #tests }
PMPermutationTest >> testDiscriminant [

self assert: PMPermutation new discriminant equals:0.
self assert: (PMPermutation identity: 1) discriminant equals:0.
self assert: (PMPermutation identity: 4) discriminant equals:0.
self assert: (PMPermutation ordering: #(2 1 4 3)) discriminant equals:2.
self assert: (PMPermutation ordering: #(5 3 2 4 1)) discriminant equals:2.
self assert: (PMPermutation ordering: #(3 5 2 1 6 4)) discriminant equals:5.
self assert: (PMPermutation ordering: #(4 3 1 2 6 7 5)) discriminant equals:5
]

{ #category : #tests }
PMPermutationTest >> testEvenOdd [
|a|
self assert: PMPermutation new even.
self assert: (PMPermutation identity: 1) even.
self deny: (PMPermutation identity: 4) odd.
self assert: (PMPermutation ordering: #(2 1 4 3)) even.
self deny: (PMPermutation ordering: #(5 3 2 4 1)) odd.
self assert: (PMPermutation ordering: #(3 5 2 1 6 4)) odd.
self deny: (PMPermutation ordering: #(4 3 1 2 6 7 5)) even.
a:=PMPermutation allOfSize: 4.
self assert: (a select:[:b|b odd])size equals:12.
a:=PMPermutation allOfSize: 3.
self assert: (a select:[:b|b even])size equals:3.
]

{ #category : #tests }
PMPermutationTest >> testExtendTo [
	self assert: (PMPermutation new extendTo: 3)equals: (PMPermutation identity: 3).
	self assert: ((PMPermutation identity: 1)extendTo: 3) equals: (PMPermutation identity: 3).
	self assert: ((PMPermutation identity: 3)extendTo: 3) equals: (PMPermutation identity: 3).
	self assert: ((PMPermutation ordering: #(3 1 4 2))extendTo: 4) equals: #(3 1 4 2).
	self assert: ((PMPermutation ordering: #(3 1 4 2))extendTo: 5) equals: #(3 1 4 2 5).
	self assert: ((PMPermutation ordering: #(3 1 4 2))extendTo: 7) equals: #(3 1 4 2 5 6 7)
]

{ #category : #'class tests' }
PMPermutationTest >> testFromCycles [

	self assertEmpty: (PMPermutation fromCycles: #(  )).
	self assertEmpty: (PMPermutation fromCycles: #( #(  ) )).
	self assert: (PMPermutation fromCycles: #( #( 1 ) )) equals: #( 1 ).
	self assert: (PMPermutation size: 3 fromCycles: #(  )) equals: #( 1 2 3 ).
	self assert: (PMPermutation size: 3 fromCycles: #( #(  ) )) equals: #( 1 2 3 ).
	self assert: (PMPermutation fromCycles: #( #( 1 3 4 2 ) )) equals: #( 3 1 4 2 ).
	self assert: (PMPermutation fromCycles: #( #( 1 2 4 6 8 ) #( 5 7 ) )) equals: #( 2 4 3 6 7 8 5 1 ).
	self assert: (PMPermutation fromCycles: #( #( 1 5 ) #( 2 4 3 ) )) equals: #( 5 4 2 3 1 ).
	self assert: (PMPermutation fromCycles: #( #( 1 ) #( 3 5 4 ) #( 6 ) #( 2 ) )) equals: #( 1 2 5 3 4 6 ).
	self assert: (PMPermutation size: 6 fromCycles: #( #( 3 5 4 ) )) equals: #( 1 2 5 3 4 6 )
]

{ #category : #'class tests' }
PMPermutationTest >> testGenerator [
|g c|
g:=PMPermutation generator: (Array with: (PMPermutation size: 7 shift: 2)).
g do:[:p|self assert: p class equals:PMPermutation].
self assert: g size equals: 7.
self assert: (g includes: (PMPermutation identity: 7)) .
g:=PMPermutation generator: (Array
	with: (PMPermutation size: 6 shift: 2)
	with: (PMPermutation identity: 6)reverse).
self assert: g size equals: 6.
self assert: (g includes: (PMPermutation identity: 6)) .

g:=PMPermutation generator: (Array
	with: (PMPermutation fromCycles: #((2 3 4 5)))
	with: (PMPermutation fromCycles: #((1 2)))).
c:=(PMPermutation allOfSize: 5).
self assert: g asSet equals: c asSet.
self assert: g size equals: c size.
g:=PMPermutation generator: (Array
	with: (PMPermutation fromCycles: #((3 4 5)))
	with: (PMPermutation fromCycles: #((1 2 3)))).
c:=c select:[:p|p even].
self assert: g asSet equals: c asSet.
self assert: g size equals: c size
]

{ #category : #'class tests' }
PMPermutationTest >> testIdentity [
|p c|
p:=PMPermutation identity: 0.
self assert: p equals: #().
p:=PMPermutation identity: 1.
self assert: p equals: #(1).
p:=PMPermutation identity: 4.
c:=PMPermutation ordering: #(1 3 2 4).
self assert: (p permute: c) equals: c.
self assert: (c permute: p) equals: c
]

{ #category : #tests }
PMPermutationTest >> testInverse [
|p|
p:=PMPermutation ordering: #(2 4 3 1 5).
self assert: (p inverse permute: p )
	  equals: (1 to:5 ).
self assert: (p permute: p inverse)
	  equals: (1 to:5 )
]

{ #category : #tests }
PMPermutationTest >> testIsCollection [
|p|
5 timesRepeat: [p:=PMPermutation randomPermutation: 11.self deny: p isCollection ]
]

{ #category : #'class tests' }
PMPermutationTest >> testOrdering [
|p|
self should:[PMPermutation ordering: #(2 3 3 1)]raise: Error.
p:=PMPermutation ordering: #().
self assert: p equals: #().
p:=PMPermutation ordering: #(4 3 -1.9).
self assert: p equals: #(3 2 1).
p:=PMPermutation ordering: #(cc cs b).
self assert: p equals: #(2 3 1).
p:=PMPermutation newFrom: #(cc cs b).
self assert: p class equals: PMPermutation.
self assert: p first equals: #cc.
self assert: p third equals: #b.
p reduce.
self assert: p equals: #(2 3 1)
]

{ #category : #tests }
PMPermutationTest >> testPermute [
|p i|
p:=PMPermutation ordering: #(2 4 3 1).
i:=PMPermutation identity: 4.
self assert: (p permute: #(10 20 30 '40' 5.6)asOrderedCollection )
	  equals: #(20 '40' 30 10 5.6)asOrderedCollection .
self assert: (p permute: 'abcD')
	  equals: 'bDca' .
self assert: (p permute: i)
	  equals: p .
self assert: (i permute: p)
	  equals: p .
self assert: (PMPermutation new permute: p)
	  equals: p .
self assert: (p permute: PMPermutation new)
	  equals: p .
self assert: (p permute: (PMPermutation fromCycles: #((1 3))))
	  equals: ((PMPermutation fromCycles: #((4 3))) permute: p) .
i:=PMPermutation ordering: #(4 1 2 3).
self assert: (p permute: (i permute: 'aBcD'))
	  equals: ((p permute: i) permute: 'aBcD') .
self should: [ i permute:'aBc' ] raise: SizeMismatch .
"and i would say:"
self should: [ (PMPermutation identity: 4) permute:'aBc' ] raise: SizeMismatch
]

{ #category : #'class tests' }
PMPermutationTest >> testRandomGenerator [

	| g |
	g := PMPermutation randomGenerator.
	g := g next: 4.
	self assert: g size equals: 4.
	self deny: g first equals: g second.
	self assert: g third isFloat
]

{ #category : #'class tests' }
PMPermutationTest >> testRandomPermutation [

	| p p2 l |
	l := 173. "relatively high for a randomized test"
	PMPermutation randomGenerator seed: 10. "can be put into comments for a randomized test"
	p := PMPermutation randomPermutation: l.
	p2 := PMPermutation randomPermutation: l.
	self deny: p equals: p2.
	self assert: p class equals: PMPermutation.
	l := 1 to: l.
	self assert: p sorted equals: l.
	self assert: p2 sorted equals: l
]

{ #category : #tests }
PMPermutationTest >> testReduce [
|p|
p:=PMPermutation newFrom: #(2 3 1).
self assert: p reduce equals: #(2 3 1).
p:=PMPermutation newFrom: #(3 5 2).
self assert: p  equals: #(3 5 2).
p reduce.
self assert: p equals: #(2 3 1).
p:=PMPermutation newFrom: #().
self assert: p reduce equals: #().
p:=PMPermutation newFrom: #(0.8).
self assert: p reduce equals: #(1)
]

{ #category : #tests }
PMPermutationTest >> testReversed [
|p|
p:=PMPermutation ordering: #(2 4 3 1 5).
self assert: (p reversed )
	  equals: #(5 1 3 4 2).
self assert: (p class)
	  equals: PMPermutation
]

{ #category : #tests }
PMPermutationTest >> testShift [
|p|
self assert: (p:=PMPermutation size: 4 shift: 1) equals: #(2 3 4 1).
self assert: (p shift: 0) equals: #(2 3 4 1).
self assert: (p shift: -1) equals: #(1 2 3 4).
self assert: (p shift: -8) equals: #(1 2 3 4).
self assert: (p shift: 4) equals: #(1 2 3 4).
self assert: (p shift: 2) equals: #(3 4 1 2).
self assert: (PMPermutation size: 5 shift: 2) equals: #(3 4 5 1 2).
self assert: (PMPermutation size: 4 shift: 3) equals: (p shift: 1).
self assert: (PMPermutation size: 4 shift: 4) equals: #(1 2 3 4).
self assert: (PMPermutation size: 4 shift: -1) equals: #(4 1 2 3).
self assert: (PMPermutation size: 5 shift: -2) equals: #(4 5 1 2 3).
self assert: (PMPermutation size: 1 shift: 1) equals: #(1).
self assert: (PMPermutation size: 0 shift: 2) equals: #().
p:=PMPermutation randomPermutation: 6.
self assert: (p shift: -8) equals: (p shift:4)
]

{ #category : #'class tests' }
PMPermutationTest >> testSizeShift [
|p |
p:=PMPermutation size: 0 shift: 1.
self assert: p equals: #().
p:=PMPermutation size: 1 shift: -1.
self assert: p equals: #(1).
p:=PMPermutation size: 4 shift: -1.
self assert: p equals: (PMPermutation ordering:#(4 1 2 3)).
p:=PMPermutation size: 4 shift: 2.
self assert: p equals: (PMPermutation ordering:#(3 4 1 2))
]

{ #category : #'class tests' }
PMPermutationTest >> testStirling1Over [
self assert: (PMPermutation stirling1: 5 over: 5) equals: 1.
self assert: (PMPermutation stirling1: 5 over: 3) equals: 35.
self assert: (PMPermutation stirling1: 5 over: 2) equals: 50.
self assert: (PMPermutation stirling1: 5 over: 1) equals: 24.
self assert: (PMPermutation stirling1: 5 over: 0) equals: 0.
self assert: (PMPermutation stirling1: 0 over: 5) equals: 0
]
