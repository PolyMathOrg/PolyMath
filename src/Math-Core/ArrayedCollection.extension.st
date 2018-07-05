Extension { #name : #ArrayedCollection }

{ #category : #'*Math-Core' }
ArrayedCollection >> addWithVector: aVector [
	"Answers the sum of the receiver with aVector."
	| answer n |
	answer := self class new: self size.
	n := 0.
	self with: aVector do:
		[ :a :b | 
		  n := n + 1. 
		  answer at: n put: ( a + b).
		].
	^ answer
]
