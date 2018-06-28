Class {
	#name : #LinearCongruentialRandomTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-Random'
}

{ #category : #tests }
LinearCongruentialRandomTest >> testNextBetweenZeroAndOne [
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	1000
		timesRepeat: [ self assert: g next >= 0.
			self assert: g next <= 1 ]
]

{ #category : #tests }
LinearCongruentialRandomTest >> testPeekAlwaysReplyTheSameValue [
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	self assert: g peek equals: g peek
]

{ #category : #tests }
LinearCongruentialRandomTest >> testPeekAnswersSameAsNext [
	| g |
	g := PMLinearCongruentialRandomGenerator new.
	self assert: g peek equals: g next
]
