Extension { #name : #Number }

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Number >> arCosh [
	"Answer receiver's area hyperbolic cosine.
	That is the inverse function of cosh."

	^self asFloat arCosh
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Number >> arSinh [
	"Answer receiver's area hyperbolic sine.
	That is the inverse function of sinh."

	^self asFloat arSinh
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Number >> arTanh [
	"Answer receiver's area hyperbolic tangent.
	That is the inverse function of tanh."

	^self asFloat arTanh
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Number >> cosh [
	"Answer receivers hyperbolic cosine."

	^self asFloat cosh
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Number >> sinc [
	"Answer receivers cardinal sine."

	^ self isZero
		ifTrue: [self class one]
		ifFalse: [self sin / self]
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Number >> sinh [
	"Answer receivers hyperbolic sine"

	^self asFloat sinh
]

{ #category : #'*Math-Number-Extensions-mathematical functions' }
Number >> tanh [
	"Answer receivers hyperbolic tangent"

	^self asFloat tanh
]
