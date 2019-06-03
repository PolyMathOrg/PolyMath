Class {
	#name : #PMLinearCongruentialRandomTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMLinearCongruentialRandomTest >> testNextBetweenZeroAndOne [
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	1000
		timesRepeat: [ self assert: g next >= 0.
			self assert: g next <= 1 ]
]

{ #category : #tests }
PMLinearCongruentialRandomTest >> testPeekAnswersSameAsNext [
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	self assert: g peek equals: g next
]

{ #category : #tests }
PMLinearCongruentialRandomTest >> testPeekIsIdempotent [
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	self assert: g peek equals: g peek
]
