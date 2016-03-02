accessing
data: anArrayOfNumberOrComplex
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