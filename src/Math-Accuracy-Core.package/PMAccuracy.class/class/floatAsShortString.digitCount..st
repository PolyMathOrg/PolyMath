util
floatAsShortString: aFloat digitCount: digitCount 
"essentially copied fromFloat>>absPrintOn:base:digitCount:"
	| fuzz x exp q fBase scale logScale xi aStream posFloat |
	aFloat isNaN ifTrue:[^'NaN'].
	aFloat =0 ifTrue:[^'0.0'].
	aStream:=WriteStream on:''.
	posFloat :=aFloat <0 
		ifTrue:[aStream nextPut: $-.aFloat negated]
		ifFalse:[aFloat ].
	posFloat isInfinite ifTrue: [aStream nextPutAll: 'Infinity'.
		^ aStream contents].
	fBase := 10.0.
	"x is myself normalized to [1.0, fBase), exp is my exponent"
	exp := 
		posFloat  < 1.0
			ifTrue: [posFloat reciprocalFloorLog: fBase]
			ifFalse: [posFloat floorLog: fBase].
	scale := 1.0.
	logScale := 0.
	[(x := fBase raisedTo: (exp + logScale)) = 0]
		whileTrue:
			[scale := scale * fBase.
			logScale := logScale + 1].
	x := posFloat * scale / x.
	fuzz := fBase raisedTo: 1 - digitCount.
	"round the last digit to be printed"
	x := 0.5 * fuzz + x.
	x >= fBase
		ifTrue: 
			["check if rounding has unnormalized x"
			x := x / fBase.
			exp := exp + 1].
	(exp < (digitCount-1) and: [exp > (-2) ])
		ifTrue: 
			["decimal notation"
			q := 0.
			exp < 0 ifTrue: [1 to: 1 - exp do: [:i | aStream nextPut: ('0.' at:i)]]]
		ifFalse: 
			["scientific notation"
			q := exp.
			exp := 0].
	[x >= fuzz]
		whileTrue: 
			["use fuzz to track significance"
			xi := x asInteger.
			aStream nextPut: (Character digitValue: xi).
			x := x - xi asFloat * fBase.
			fuzz := fuzz * fBase.
			exp := exp - 1.
			exp = -1 ifTrue: [aStream nextPut: $.]].
	[exp >= -1]
		whileTrue: 
			[aStream nextPut: $0.
			exp := exp - 1.
			exp = -1 ifTrue: [aStream nextPut: $.]].
	q ~= 0
		ifTrue: 
			[aStream nextPut: $e.
			q printOn: aStream].
	^ aStream contents