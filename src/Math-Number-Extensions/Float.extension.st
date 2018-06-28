Extension { #name : #Float }

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Float >> arCosh [
	"Answer receiver's area hyperbolic cosine.
	That is the inverse function of cosh."

	self < 1 
		ifTrue: 
			[^DomainError signal: 'Receiver must be greater or equal to 1'].
	^self + 1 = self 
		ifTrue: [self abs ln + 2 ln]
		ifFalse: [((self squared - 1) sqrt + self) ln]
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Float >> arSinh [
	"Answer receiver's area hyperbolic sine.
	That is the inverse function of sinh."

	self = 0.0 ifTrue: [^self].	"Handle negativeZero"  
	^self + 1 = self 
		ifTrue: [(self abs ln + 2 ln) * self sign]
		ifFalse: [((self squared + 1) sqrt + self) ln]
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Float >> arTanh [
	"Answer receiver's area hyperbolic tangent.
	That is the inverse function of tanh."

	self = 0.0 ifTrue: [^self].	"Handle negativeZero"
	self abs = 1 ifTrue: [^self copySignTo: Float infinity].
	self abs > 1 
		ifTrue: 
			[^DomainError signal: 'Receiver must be between -1.0 and 1.0'].
	^((1 + self) / (1 - self)) ln / 2
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Float >> cosh [
	"Answer receivers hyperbolic cosine."
	
	| ex |
	ex := self exp.
	^(ex + ex reciprocal) / 2
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Float >> sinh [
	"Answer receivers hyperbolic sine"
	
	| ex |
	ex := self exp.
	^(ex - ex reciprocal) / 2
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Float >> tanh [
	"Answer hyperbolic tangent of receiver.
	Trivial implementation is:
		^self sinh/self cosh
	This implementation takes care not to overflow."

	| ex emx |
	self > 20.0 ifTrue: [^1.0].
	self < -20.0 ifTrue: [^-1.0].
	ex := self exp.
	emx := ex reciprocal.
	^(ex - emx) / (ex + emx)
]
