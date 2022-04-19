"
A FastFourierTransform can be initialized with: 
FastFourierTransform data: anArrayOfNumbersOrComplex
you can look at the data with #data, #realData and #imaginaryData.
#transform calculates the Fourier transform (in place, iow you get the transform again with #data etc) and #inverseTransform does the inverse. 
"
Class {
	#name : #PMFastFourierTransform,
	#superclass : #Object,
	#instVars : [
		'nu',
		'n',
		'sinTable',
		'permTable',
		'data'
	],
	#category : #'Math-FastFourierTransform'
}

{ #category : #'instance creation' }
PMFastFourierTransform class >> data: anArrayOfNumbersOrComplex [
	^ self new
		data: anArrayOfNumbersOrComplex;
		yourself 
]

{ #category : #accessing }
PMFastFourierTransform >> chop: tolerance [
	"sets numbers smaller than tolerance to zero"

	| r i | 
	^ data := data
		collect:
			[ :k | 
			r := k real.
			i := k imaginary.
			r abs < tolerance
				ifTrue: [ r := 0 ].
			i abs < tolerance
				ifTrue: [ i := 0 ].
			PMComplex real: r imaginary: i ]
]

{ #category : #accessing }
PMFastFourierTransform >> data [
	^ data
]

{ #category : #accessing }
PMFastFourierTransform >> data: anArrayOfNumberOrComplex [
	| aSize |
	aSize := anArrayOfNumberOrComplex size.
	aSize < 4
		ifTrue: [ ^ self error: 'dataSize must be at least 4' ].
	aSize isPowerOfTwo
		ifFalse: [ ^ self error: 'dataSize must be a power of two' ].
	data := anArrayOfNumberOrComplex collect: [ :i | i asComplex ] as: Array.
	n = aSize
		ifTrue: [ ^ data ].
	"initialize the rest:"
	n := aSize.
	nu := (aSize log: 2) asInteger.
	self initPermTable.
	self initSinTable.
	^ data
]

{ #category : #accessing }
PMFastFourierTransform >> imaginaryData [
	^ data collect: [ :i | i imaginary ] 
]

{ #category : #initializing }
PMFastFourierTransform >> initPermTable [
	| r |
	permTable := OrderedCollection new: n // 2.
	2 to: n - 1 do: [ :i | 
		r := (i - 1 bitReverse: nu) + 1.
		r > i
			ifTrue: [ permTable
					add: (Array with: i with: r) ] ]
]

{ #category : #initializing }
PMFastFourierTransform >> initSinTable [
	| d |
	d := n // 2.
	sinTable := (0 to: n // 4) collect: [ :i | (Float pi * i / d) sin ]
]

{ #category : #evaluation }
PMFastFourierTransform >> inverseTransform [
	self transformForward: false.
	^ data
]

{ #category : #private }
PMFastFourierTransform >> multiplier: theta [
	^ theta < (n // 4)
		ifTrue:
			[ PMComplex real: (sinTable at: sinTable size - theta) imaginary: (sinTable at: theta + 1) ]
		ifFalse:
			[ PMComplex
				real: (sinTable at: theta - (n // 4) + 1) negated
				imaginary: (sinTable at: n // 2 - theta + 1) ]
]

{ #category : #accessing }
PMFastFourierTransform >> n [
	^ n 
]

{ #category : #accessing }
PMFastFourierTransform >> realData [ 
	^ data collect: [ :i | i real ]
]

{ #category : #private }
PMFastFourierTransform >> scaleData [
	| temp |
	temp := n sqrt.
	data := data collect: [ :j | PMComplex real: j real / temp imaginary: j imaginary / temp ]	"minimizes floating point error this way"
]

{ #category : #evaluation }
PMFastFourierTransform >> transform [
	self transformForward: true.
	^ data
]

{ #category : #private }
PMFastFourierTransform >> transformForward: forward [ 
	| lev lev1 ip temp temp2 i |
	permTable do: [ :j | data swap: j first with: j second ].
	1 to: nu do:
		[ :level | 
		lev := 1 bitShift: level.
		lev1 := lev // 2.
		1 to: lev1 do:
			[ :j | 
			temp := self multiplier: (j - 1) * (n // lev).
			forward
				ifFalse: [ temp := temp complexConjugate ].
			i := j.
			[ i <= n ]
				whileTrue:
					[ ip := i + lev1.
					temp2 := (data at: ip) * temp.
					data at: ip put: (data at: i) - temp2.
					data at: i put: (data at: i) + temp2.
					i := i + lev ] ] ].
	self scaleData
]
