Class {
	#name : #MersenneTwisterRandomTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-Random'
}

{ #category : #tests }
MersenneTwisterRandomTest >> testNext10BetweenZeroAndTen [
	| g |
	g := PMMersenneTwisterRandomGenerator new.
	1000
		timesRepeat: [ | value |
			value := g next.
			self assert: value > 0.
			self assert: value < 10 ]
]

{ #category : #tests }
MersenneTwisterRandomTest >> testNextBetweenZeroAndOne [
	| g |
	g := PMMersenneTwisterRandomGenerator new.
	1000
		timesRepeat: [ self assert: g next > 0.
			self assert: g next < 1 ]
]

{ #category : #tests }
MersenneTwisterRandomTest >> testNextFloatExcludeUpper [
	"this revealed a bug in early versions, excludeUpper was producing between 0 and 2"

	| g sample1 sample2 |
	g := PMMersenneTwisterRandomGenerator new.
	sample1 := Array new: 10000.
	sample2 := Array new: 10000.
	1 to: 10000 do: [ :i | 
		sample1 at: i put: g nextFloatExcludeUpper.
		sample2 at: i put: (g nextFloatExcludeUpper: 2) ].
	self assert: sample1 max < 1.
	self shouldnt: [ sample1 max < 0.8 ].
	self assert: sample2 max < 2.
	self shouldnt: [ sample2 max < 1.6 ]
]
