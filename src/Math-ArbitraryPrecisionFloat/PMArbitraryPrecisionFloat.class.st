"
I store floating point numbers in base 2 with some arbitrary precision (arbitrary number of bits).
I do inexact arithmetic like Float.
But I am very slow due to emulated (Large) Integer arithmetic... (compared to IEEE 754 hardwired)

Unlike Float, mantissa is not normalized under the form 1.mmmmmm
It is just stored as an integer.
The sign is stored in the mantissa.
biasedExponent is the power of two that multiply the mantissa to form the number. there is no limitation of exponent (overflow or underflow), unless you succeed in exhausting the VM memory...

Like Float, my arithmetic operations are inexact. They will round to nearest nBits ArbitraryPrecisionFloat.

If two different precisions are used in arithmetic, the result is expressed in the higher precision.

Default operating mode is rounding, but might be one of the other possibility (truncate floor ceiling).

Instance Variables:
	biasedExponent	<Integer>	the times two power to multiply the mantissa (floating binary scale)
	mantissa	<Integer>	the bits of mantissa including sign
	nBits	<Magnitude>	number of bits to be stored in mantissa when i am normalized

"
Class {
	#name : #PMArbitraryPrecisionFloat,
	#superclass : #Number,
	#instVars : [
		'nBits',
		'mantissa',
		'biasedExponent'
	],
	#category : #'Math-ArbitraryPrecisionFloat'
}

{ #category : #examples }
PMArbitraryPrecisionFloat class >> example1 [

"Compute Pi with nbits of precision"

| a b c k pi oldpi oldExpo expo nBits str |
nBits := 100.

a := PMArbitraryPrecisionFloat one asArbitraryPrecisionFloatNumBits: nBits + 16.
b := (a timesTwoPower: 1) sqrt reciprocal.
c := a timesTwoPower: -1.
k := 1.
oldpi := Float pi.
oldExpo := 2.

[| am gm a2 |
	am := a + b timesTwoPower: -1.
	gm := (a * b) sqrt.
	a := am.
	b := gm.
	a2 := a squared.
	c inPlaceSubtract: (a2 - b squared timesTwoPower: k).
	pi := (a2 timesTwoPower: 1) / c.
	expo := (oldpi - pi) exponent.
	expo isZero or: [expo > oldExpo or: [expo < (-1 - nBits)]]]
			whileFalse:
				[oldpi := pi.
				oldExpo := expo.
				k := k + 1].
pi asArbitraryPrecisionFloatNumBits: nBits.
str := (String new: 32) writeStream.
pi absPrintExactlyOn: str base: 10.
str contents
]

{ #category : #'instance creation' }
PMArbitraryPrecisionFloat class >> mantissa: mantisInteger exponent: expoInteger nBits: nbitsInteger [
	^self basicNew
		mantissa: mantisInteger
		exponent: expoInteger
		nBits: nbitsInteger
]

{ #category : #'instance creation' }
PMArbitraryPrecisionFloat class >> readFrom: aStream numBits: n [
	"read a number from an ASCII encoded decimal representation with
	- an optional sign {-|+}
	- an integer part [0-9]+
	- an optional decimalPoint and fractionPart {.[0-9]*}
	- an optional exponent {e{-|+}[0-9]+}"

	^(ExtendedNumberParser on: aStream)
		failBlock: [self error: 'invalid ArbitraryPrecisionFloat format'];
		nextArbitraryPrecisionFloatNumBits: n
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> * aNumber [
	| n |
	aNumber class = self class
		ifFalse: [^ aNumber adaptToArbitraryPrecisionFloat: self andSend: #*].
	n := nBits max: aNumber numBits.
	^ (self asArbitraryPrecisionFloatNumBits: n)
		copy inPlaceMultiplyBy: (aNumber asArbitraryPrecisionFloatNumBits: n)
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> + aNumber [
	| n |
	aNumber class = self class
		ifFalse: [^ aNumber adaptToArbitraryPrecisionFloat: self andSend: #+].
	n := nBits max: aNumber numBits.
	^ (self asArbitraryPrecisionFloatNumBits: n)
		copy inPlaceAdd: (aNumber asArbitraryPrecisionFloatNumBits: n)
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> - aNumber [
	| n |
	aNumber class = self class
		ifFalse: [^ aNumber adaptToArbitraryPrecisionFloat: self andSend: #-].
	n := nBits max: aNumber numBits.
	^ (self asArbitraryPrecisionFloatNumBits: n)
		copy inPlaceSubtract: (aNumber asArbitraryPrecisionFloatNumBits: n)
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> / aNumber [
	| n |
	aNumber class = self class
		ifFalse: [^ aNumber adaptToArbitraryPrecisionFloat: self andSend: #/].
	n := nBits max: aNumber numBits.
	^ (self asArbitraryPrecisionFloatNumBits: n)
		copy inPlaceDivideBy: (aNumber asArbitraryPrecisionFloatNumBits: n)
]

{ #category : #comparing }
PMArbitraryPrecisionFloat >> < aNumber [

	aNumber class = self class ifTrue: [
		^ self negative == aNumber negative
			  ifTrue: [
				  self negative
					  ifTrue: [ (self digitCompare: aNumber) > 0 ]
					  ifFalse: [ (self digitCompare: aNumber) < 0 ] ]
			  ifFalse: [ self negative ] ].
	^ aNumber adaptToArbitraryPrecisionFloat: self andCompare: #<
]

{ #category : #comparing }
PMArbitraryPrecisionFloat >> = aNumber [

	aNumber isNumber ifFalse: [ ^ false ].
	aNumber class = self class ifTrue: [
		^ aNumber negative == self negative
			  ifTrue: [ (self digitCompare: aNumber) = 0 ]
			  ifFalse: [ false ] ].
	^ aNumber adaptToArbitraryPrecisionFloat: self andCompare: #=
]

{ #category : #comparing }
PMArbitraryPrecisionFloat >> > aNumber [

	aNumber class = self class ifTrue: [
		^ self negative == aNumber negative
			  ifTrue: [
				  self negative
					  ifTrue: [ (self digitCompare: aNumber) < 0 ]
					  ifFalse: [ (self digitCompare: aNumber) > 0 ] ]
			  ifFalse: [ aNumber negative ] ].
	^ aNumber adaptToArbitraryPrecisionFloat: self andCompare: #>
]

{ #category : #printing }
PMArbitraryPrecisionFloat >> absPrintExactlyOn: aStream base: base [
	"Print my value on a stream in the given base.
	Based upon the algorithm outlined in:
	Robert G. Burger and R. Kent Dybvig
	Printing Floating Point Numbers Quickly and Accurately
	ACM SIGPLAN 1996 Conference on Programming Language Design and Implementation
	June 1996.
	This version guarantees that the printed representation exactly represents my value
	by using exact integer arithmetic."

	| fBase significand exp baseExpEstimate r s mPlus mMinus scale roundingIncludesLimits d tc1 tc2 fixedFormat decPointCount shead slowbit |
	fBase := base asFloat.
	self normalize.
	significand := mantissa abs.
	roundingIncludesLimits := significand even.
	exp := biasedExponent.
	baseExpEstimate := (self exponent * fBase reciprocalLogBase2 - 1.0e-10) ceiling.
	exp >= 0
		ifTrue: [
			mPlus := significand isPowerOfTwo
				         ifTrue: [
					         r := significand bitShift: 2 + exp.
					         s := 4.
					         2 * (mMinus := 1 bitShift: exp) ]
				         ifFalse: [
					         r := significand bitShift: 1 + exp.
					         s := 2.
					         mMinus := 1 bitShift: exp ] ]
		ifFalse: [
			significand isPowerOfTwo
				ifTrue: [
					r := significand bitShift: 2.
					s := 1 bitShift: 2 - exp.
					mPlus := 2.
					mMinus := 1 ]
				ifFalse: [
					r := significand bitShift: 1.
					s := 1 bitShift: 1 - exp.
					mPlus := mMinus := 1 ] ].
	baseExpEstimate >= 0
		ifTrue: [ s := s * (base raisedToInteger: baseExpEstimate) ]
		ifFalse: [
			scale := base raisedToInteger: baseExpEstimate negated.
			r := r * scale.
			mPlus := mPlus * scale.
			mMinus := mMinus * scale ].
	(r + mPlus >= s and: [ roundingIncludesLimits or: [ r + mPlus > s ] ])
		ifTrue: [ baseExpEstimate := baseExpEstimate + 1 ]
		ifFalse: [
			r := r * base.
			mPlus := mPlus * base.
			mMinus := mMinus * base ].
	(fixedFormat := baseExpEstimate between: -3 and: 6)
		ifTrue: [
			decPointCount := baseExpEstimate.
			baseExpEstimate <= 0 ifTrue: [ aStream nextPutAll: ('0.000000' truncateTo: 2 - baseExpEstimate) ] ]
		ifFalse: [ decPointCount := 1 ].
	slowbit := 1 - s lowBit.
	shead := s bitShift: slowbit.
	[
	d := (r bitShift: slowbit) // shead.
	r := r - (d * s).
	(tc1 := r <= mMinus and: [ roundingIncludesLimits or: [ r < mMinus ] ]) | (tc2 := r + mPlus >= s and: [ roundingIncludesLimits or: [ r + mPlus > s ] ]) ]
		whileFalse: [
			aStream nextPut: (Character digitValue: d).
			r := r * base.
			mPlus := mPlus * base.
			mMinus := mMinus * base.
			decPointCount := decPointCount - 1.
			decPointCount = 0 ifTrue: [ aStream nextPut: $. ] ].
	tc2 ifTrue: [ (tc1 not or: [ r * 2 >= s ]) ifTrue: [ d := d + 1 ] ].
	aStream nextPut: (Character digitValue: d).
	decPointCount > 0 ifTrue: [
		decPointCount - 1 to: 1 by: -1 do: [ :i | aStream nextPut: $0 ].
		aStream nextPutAll: '.0' ].
	fixedFormat ifFalse: [
		aStream nextPut: $e.
		aStream nextPutAll: (baseExpEstimate - 1) printString ]
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToFloat: rcvr andCompare: selector [
	^ (rcvr isInfinite or: [ rcvr isNaN ])
		ifTrue: [ rcvr perform: selector with: self asFloat ]
		ifFalse: [ (rcvr asArbitraryPrecisionFloatNumBits: 53) perform: selector with: self ]
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToFloat: rcvr andSend: selector [
	^ (rcvr isInfinite or: [ rcvr isNaN ])
		ifTrue: [ rcvr perform: selector with: self asFloat ]
		ifFalse: [ (rcvr asArbitraryPrecisionFloatNumBits: 53) perform: selector with: self ]
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToFraction: rcvr andCompare: selector [
	"If I am involved in comparison with a Fraction, convert myself to a
	Fraction. This way, no bit is lost and comparison is exact."

	^ rcvr perform: selector with: self asTrueFraction
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToFraction: rcvr andSend: selector [
	^(rcvr asArbitraryPrecisionFloatNumBits: nBits) perform: selector with: self
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToInteger: rcvr andCompare: selector [
	"If I am involved in comparison with an Integer, convert myself to a
	Fraction. This way, no bit is lost and comparison is exact."

	^ rcvr perform: selector with: self asTrueFraction
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToInteger: rcvr andSend: selector [
	^(rcvr asArbitraryPrecisionFloatNumBits: nBits) perform: selector with: self
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToScaledDecimal: rcvr andCompare: selector [
	"If I am involved in comparison with a ScaledDecimal, convert myself to a
	Fraction. This way, no bit is lost and comparison is exact."

	^ rcvr asFraction perform: selector with: self asFraction
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> adaptToScaledDecimal: rcvr andSend: selector [
	^(rcvr asArbitraryPrecisionFloatNumBits: nBits) perform: selector with: self
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> agm: aNumber [
	"Answer the arithmetic geometric mean of self and aNumber"

	| a b am gm |
	a := self.
	b := aNumber.

	[am := a + b timesTwoPower: -1.	"am is arithmetic mean"
	gm := (a * b) sqrt.	"gm is geometric mean"
	a = am or: [b = gm]]
			whileFalse:
				[a := am.
				b := gm].
	^am
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> arCosh [
	"Evaluate the area hyperbolic cosine of the receiver."

	| arCosh x one y two |
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	one := x one.
	x < one ifTrue: [ DomainError signal: 'cannot compute arCosh of a number less than 1' ].
	x = one ifTrue: [ ^ self zero ].
	y := x - one.
	arCosh := y < one
		          ifTrue: [
			          y exponent * -4 >= nBits
				          ifTrue: [ (y powerExpansionArCoshp1Precision: y numBits) * (y timesTwoPower: 1) sqrt ]
				          ifFalse: [
					          two := one timesTwoPower: 1.
					          ((y * (y + two)) sqrt + y + one) ln ] ]
		          ifFalse: [ ((x squared - one) sqrt + x) ln ].
	^ arCosh asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> arSinh [
	"Evaluate the area hyperbolic sine of the receiver."

	| arSinh x one |
	self isZero ifTrue: [ ^ self ].
	self exponent negated > nBits ifTrue: [ ^ self ].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	arSinh := self exponent * -4 >= nBits
		          ifTrue: [ x powerExpansionArSinhPrecision: x numBits ]
		          ifFalse: [
			          one := x one.
			          ((x squared + one) sqrt + x) ln ].
	self negative ifTrue: [ arSinh inPlaceNegated ].
	^ arSinh asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> arTanh [
	"Evaluate the area hyperbolic tangent of the receiver."

	| arTanh x one |
	self isZero ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	one := x one.
	x >= one ifTrue: [DomainError signal: 'cannot evaluate arTanh of number of magnitude >= 1'].
	self exponent * -4 >= nBits
		ifTrue: [arTanh := x powerExpansionArTanhPrecision: x numBits]
		ifFalse:
			[arTanh := ((one + x) / (one - x)) ln.
			arTanh inPlaceTimesTwoPower: -1].
	self negative ifTrue: [arTanh inPlaceNegated].
	^arTanh asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> arcCos [
	"Evaluate the arc cosine of the receiver."

	| arcCos x one |
	self isZero ifTrue: [^(self pi timesTwoPower: -1)].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	one := x one.
	x > one ifTrue: [DomainError signal: 'cannot compute arcCos of a number greater than 1'].
	arcCos := x = one
		ifTrue: [self zero]
		ifFalse: [((one - x squared) sqrt / x) arcTan].
	self negative ifTrue: [arcCos := x pi - arcCos].
	^arcCos asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> arcSin [
	"Evaluate the arc sine of the receiver."

	| arcSin x one |
	self isZero ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	one := x one.
	x > one ifTrue: [DomainError signal: 'cannot compute arcSin of a number greater than 1'].
	arcSin := x = one
		ifTrue: [self pi timesTwoPower: -1]
		ifFalse: [self exponent * -4 >= nBits
			ifTrue: [x powerExpansionArcSinPrecision: x numBits]
			ifFalse: [(x / (one - x squared) sqrt) arcTan]].
	self negative ifTrue: [arcSin inPlaceNegated].
	^arcSin asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> arcTan [
	"Evaluate the arc tangent of the receiver."

	| x arcTan one power |
	self isZero ifTrue: [^self].
	self > 1
		ifTrue:
			[x := self asArbitraryPrecisionFloatNumBits: nBits * 2 + 2.
			x inPlaceAbs.
			arcTan := (x pi timesTwoPower: -1) - x reciprocal arcTan]
		ifFalse:
			[power := ((nBits bitShift: -1) + self exponent max: 4) highBit.
			x := self asArbitraryPrecisionFloatNumBits: nBits + (1 bitShift: 1 + power).
			x inPlaceAbs.
			one := x one.
			power timesRepeat: [x := x / (one + (one + x squared) sqrt)].
			arcTan := x powerExpansionArcTanPrecision: x numBits + 6.
			arcTan inPlaceTimesTwoPower: power].
	self negative ifTrue: [arcTan inPlaceNegated].
	^arcTan asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> arcTan: denominator [
	"Evaluate the four quadrant arc tangent of the argument denominator (x) and the receiver (y)."

	^self isZero
		ifTrue: [denominator sign positive
			ifTrue: [ (self + denominator) zero ]
			ifFalse: [ self positive
				ifTrue: [ (self + denominator) pi ]
				ifFalse: [ (self + denominator) pi negated ]]]
		ifFalse: [denominator isZero
			ifTrue: [self positive
				ifTrue: [ (self + denominator) pi timesTwoPower: -1 ]
				ifFalse: [ (self + denominator) pi negated timesTwoPower: -1 ]]
			ifFalse:
				[ | precision arcTan |
				precision := (self + denominator) numBits.
				arcTan := ((self asArbitraryPrecisionFloatNumBits: precision * 2) / (denominator asArbitraryPrecisionFloatNumBits: precision * 2)) arcTan.
				^(denominator > 0
					ifTrue: [ arcTan ]
					ifFalse: [ self > 0
						ifTrue: [ arcTan + arcTan pi ]
						ifFalse: [ arcTan - arcTan pi ]]) asArbitraryPrecisionFloatNumBits: precision]]
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> asArbitraryPrecisionFloatNumBits: n [
	^ nBits = n
		ifTrue: [self]
		ifFalse: [self copy setPrecisionTo: n]
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> asFloat [
	"Convert to a IEEE 754 double precision floating point."

	nBits > Float precision ifTrue: [^(self copy setPrecisionTo: Float precision) asFloat].
	^mantissa asFloat timesTwoPower: biasedExponent
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> asFraction [
	^self asTrueFraction
]

{ #category : #printing }
PMArbitraryPrecisionFloat >> asMinimalDecimalFraction [
	"Answer the shortest decimal Fraction that will equal self when converted back asFloat.
	A decimal Fraction has only powers of 2 and 5 as decnominator.
	For example, 0.1 asMinimalDecimalFraction = (1/10)."

	| significand exp baseExpEstimate r s mPlus mMinus scale roundingIncludesLimits d tc1 tc2 fixedFormat decPointCount shead slowbit numerator denominator |
	self isZero ifTrue: [ ^ 0 ].
	self negative ifTrue: [ ^ self negated asMinimalDecimalFraction negated ].
	self normalize.
	significand := mantissa abs.
	roundingIncludesLimits := significand even.
	exp := biasedExponent.
	baseExpEstimate := (self exponent * 10.0 reciprocalLogBase2 - 1.0e-10) ceiling.
	numerator := 0.
	denominator := 0.
	exp >= 0
		ifTrue: [
			mPlus := significand isPowerOfTwo
				         ifTrue: [
					         r := significand bitShift: 2 + exp.
					         s := 4.
					         2 * (mMinus := 1 bitShift: exp) ]
				         ifFalse: [
					         r := significand bitShift: 1 + exp.
					         s := 2.
					         mMinus := 1 bitShift: exp ] ]
		ifFalse: [
			significand isPowerOfTwo
				ifTrue: [
					r := significand bitShift: 2.
					s := 1 bitShift: 2 - exp.
					mPlus := 2.
					mMinus := 1 ]
				ifFalse: [
					r := significand bitShift: 1.
					s := 1 bitShift: 1 - exp.
					mPlus := mMinus := 1 ] ].
	baseExpEstimate >= 0
		ifTrue: [ s := s * (10 raisedToInteger: baseExpEstimate) ]
		ifFalse: [
			scale := 10 raisedToInteger: baseExpEstimate negated.
			r := r * scale.
			mPlus := mPlus * scale.
			mMinus := mMinus * scale ].
	(r + mPlus >= s and: [ roundingIncludesLimits or: [ r + mPlus > s ] ])
		ifTrue: [ baseExpEstimate := baseExpEstimate + 1 ]
		ifFalse: [
			r := r * 10.
			mPlus := mPlus * 10.
			mMinus := mMinus * 10 ].
	(fixedFormat := baseExpEstimate between: -3 and: 6)
		ifTrue: [
			decPointCount := baseExpEstimate.
			baseExpEstimate <= 0 ifTrue: [ denominator := 10 raisedTo: baseExpEstimate negated ] ]
		ifFalse: [ decPointCount := 1 ].
	slowbit := 1 - s lowBit.
	shead := s bitShift: slowbit.
	[
	d := (r bitShift: slowbit) // shead.
	r := r - (d * s).
	(tc1 := r <= mMinus and: [ roundingIncludesLimits or: [ r < mMinus ] ]) | (tc2 := r + mPlus >= s and: [ roundingIncludesLimits or: [ r + mPlus > s ] ]) ]
		whileFalse: [
			numerator := 10 * numerator + d.
			denominator := 10 * denominator.
			r := r * 10.
			mPlus := mPlus * 10.
			mMinus := mMinus * 10.
			decPointCount := decPointCount - 1.
			decPointCount = 0 ifTrue: [ denominator := 1 ] ].
	tc2 ifTrue: [ (tc1 not or: [ r * 2 >= s ]) ifTrue: [ d := d + 1 ] ].
	numerator := 10 * numerator + d.
	denominator := 10 * denominator.
	decPointCount > 0 ifTrue: [ numerator := (10 raisedTo: decPointCount - 1) * numerator ].
	fixedFormat ifFalse: [
		baseExpEstimate - 1 > 0
			ifTrue: [ numerator := (10 raisedTo: baseExpEstimate - 1) * numerator ]
			ifFalse: [ denominator := (10 raisedTo: 1 - baseExpEstimate) * (denominator max: 1) ] ].
	denominator < 2 ifTrue: [ ^ numerator ].
	^ numerator / denominator
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> asTrueFraction [

	"First remove lowBits from mantissa.
	This can save a useless division and prevent gcd: cost"
	self reduce.

	^ biasedExponent >= 0
		ifTrue: [self shift: mantissa by: biasedExponent]
		ifFalse: [
			"Now avoid a painfull GCD: algorihm.
			mantissa is odd and cannot be reduced by a power of two.
				mantissa / (1 bitShift: exponent negated)"
			^ Fraction numerator: mantissa denominator: (1 bitShift: biasedExponent negated)]
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> biasedExponent [
	^biasedExponent
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> cos [
	^(PMArbitraryPrecisionFloatForTrigonometry
		mantissa: mantissa
		exponent: biasedExponent
		nBits: nBits) cos
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> cosh [
	| e x |
	self isZero ifTrue: [^self one].
	self exponent negated > nBits ifTrue: [^self one].
	x := self asArbitraryPrecisionFloatNumBits: nBits + 16.
	self exponent * -4 >= nBits
		ifTrue: [^(x powerExpansionCoshPrecision: x numBits) asArbitraryPrecisionFloatNumBits: nBits].
	e := x exp.
	^e
		inPlaceAdd: e reciprocal;
		inPlaceTimesTwoPower: -1;
		asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> decimalPrecision [
	^ nBits * (2 log: 10)
]

{ #category : #private }
PMArbitraryPrecisionFloat >> digitCompare: b [
	"both are positive or negative.
	answer +1 if i am of greater magnitude, -1 if i am of smaller magnitude, 0 if equal magnitude"

	| compare |
	self isZero ifTrue: [
		^ b isZero
			  ifTrue: [ 0 ]
			  ifFalse: [ -1 ] ].
	b isZero ifTrue: [ ^ 1 ].
	compare := (self exponent - b exponent) sign.
	^ compare = 0
		  ifTrue: [ (self abs - b abs) sign ]
		  ifFalse: [ compare ]
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> exp [
	"Answer the exponential of the receiver."

	| ln2 x q r ri res n maxIter p one two |
	one := self one.
	two := one timesTwoPower: 1.
	"Use following decomposition:
		x exp = (2 ln * q + r) exp.
		x exp = (2**q * r exp)"
	ln2 := two ln.
	x := self / ln2.
	q := x truncated.
	r := (x - q) * ln2.

	"now compute r exp by power series expansion
	we compute (r/(2**p)) exp ** (2**p) in order to have faster convergence"
	p := 10 min: nBits // 2.
	r := r timesTwoPower: p negated.
	ri := one asArbitraryPrecisionFloatNumBits: nBits + 16.
	res := ri copy.
	n := 0.
	maxIter := 1 + ((nBits + 16) / p) ceiling.
	[n <= maxIter] whileTrue:
			[n := n + 1.
			ri inPlaceMultiplyBy: r / n.
			res inPlaceAdd: ri].
	p timesRepeat: [res inPlaceMultiplyBy: res].
	res inPlaceTimesTwoPower: q.

	"now use a Newton iteration to refine the result
	res = res * (self - res ln + 1)"
	[| oldres delta |
	oldres := res.
	res := res asArbitraryPrecisionFloatNumBits: res numBits + 32.
	res inPlaceMultiplyBy: self - res ln + 1.
	delta := (res - oldres) exponent.
	delta = 0 or: [delta <= (res exponent - nBits - 8)]]
			whileFalse.

	^res asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> exponent [
	"anwser the floating point like exponent e,
	of self normalized as
	1.mmmmmm * (2 raisedTo: e)"

	self isZero ifTrue: [^0].
	^biasedExponent + self numBitsInMantissa - 1
]

{ #category : #comparing }
PMArbitraryPrecisionFloat >> hash [
	"Hash is reimplemented because = is implemented."

	^ self asTrueFraction hash
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceAbs [
	mantissa := mantissa abs
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceAdd: b [
	| delta |
	b isZero ifTrue: [^self round].
	self isZero
		ifTrue:
			[mantissa := b mantissa.
			biasedExponent := b biasedExponent]
		ifFalse:
			[biasedExponent = b biasedExponent
				ifTrue: [mantissa := mantissa + b mantissa]
				ifFalse:
					["check for early truncation. beware, keep 2 bits for rounding"

					delta := self exponent - b exponent.
					delta - 2 > (nBits max: self numBitsInMantissa)
						ifFalse:
							[delta negated - 2 > (nBits max: b numBitsInMantissa)
								ifTrue:
									[mantissa := b mantissa.
									biasedExponent := b biasedExponent]
								ifFalse:
									[delta := biasedExponent - b biasedExponent.
									delta > 0
										ifTrue:
											[mantissa := (self shift: mantissa by: delta) + b mantissa.
											biasedExponent := biasedExponent - delta]
										ifFalse: [mantissa := mantissa + (self shift: b mantissa by: delta negated)]]]]].
	self round
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceAddNoRound: b [
	| delta |
	b isZero ifTrue: [^self].
	self isZero
		ifTrue:
			[mantissa := b mantissa.
			biasedExponent := b biasedExponent]
		ifFalse:
			[delta := biasedExponent - b biasedExponent.
			delta isZero
				ifTrue: [mantissa := mantissa + b mantissa]
				ifFalse:
					[delta > 0
						ifTrue:
							[mantissa := (self shift: mantissa by: delta) + b mantissa.
							biasedExponent := biasedExponent - delta]
						ifFalse: [mantissa := mantissa + (self shift: b mantissa by: delta negated)]]]
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceCopy: b [
	"copy another arbitrary precision float into self"

	mantissa := b mantissa.
	biasedExponent := b biasedExponent.
	nBits := b numBits
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceDivideBy: y [
	"Reference: Accelerating Correctly Rounded
	Floating-Point Division when the Divisor
	Is Known in Advance - Nicolas Brisebarre,
	Jean-Michel Muller, Member, IEEE, and
	Saurabh Kumar Raina -
	http://perso.ens-lyon.fr/jean-michel.muller/DivIEEETC-aug04.pdf"

	| zh x q |
	zh := y reciprocal reduce.
	x := self copy.
	self inPlaceMultiplyBy: zh.
	q := self copy.
	"r := "self inPlaceMultiplyBy: y negated andAccumulate: x.
	"q' := "self inPlaceMultiplyBy: zh andAccumulate: q.

	"ALGO 4
	| zh r zl |
	zh := b reciprocal.
	r := b negated inPlaceMultiplyBy: zh andAccumulate: (1 asArbitraryPrecisionFloatNumBits: nBits).
	zl := (b asArbitraryPrecisionFloatNumBits: nBits + 1) reciprocal inPlaceMultiplyBy: r.
	self inPlaceMultiplyBy: zh andAccumulate: (zl inPlaceMultiplyBy: self)"
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceMultiplyBy: b [
	self inPlaceMultiplyNoRoundBy: b.
	self round
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceMultiplyBy: b andAccumulate: c [
	"only do rounding after the two operations.
	This is the traditional muladd operation in aritmetic units"

	self inPlaceMultiplyNoRoundBy: b.
	self inPlaceAdd: c
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceMultiplyNoRoundBy: b [
	mantissa := mantissa * b mantissa.
	biasedExponent := biasedExponent + b biasedExponent
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceNegated [
	mantissa := mantissa negated
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceReciprocal [
	| ma h |
	self isZero ifTrue: [(ZeroDivide dividend: self) signal].
	ma := mantissa abs.
	h := ma highBit.
	mantissa := (1 bitShift: h + nBits) + ma quo: (self shift: mantissa by: 1).
	biasedExponent := biasedExponent negated - h - nBits + 1.
	self round

	"Implementation notes: if m is a power of 2, reciprocal is trivial.
	Else, we have 2^h > m >2^(h-1)
	thus 1 < 2^h/m < 2.
	thus 2^(n-1) < 2^(h+n-1)/m < 2^n
	We thus have to evaluate (2^(h+n-1)/m) rounded
	Tie is away from zero because there are always trailing bits (inexact op)
	(num/den) rounded is also ((num/den)+(sign/2)) truncated
	or (num*2)+(sign*den) quo: den*2
	That's finally what we evaluate"
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceSqrt [
	"Replace the receiver by its square root."

	| guess guessSquared delta shift |
	self negative
		ifTrue:
			[^ DomainError signal: 'sqrt undefined for number less than zero.'].
	self isZero ifTrue: [^self].

	shift := 2 * nBits - mantissa highBit.
	biasedExponent := biasedExponent - shift.
	biasedExponent odd
		ifTrue:
			[shift := shift + 1.
			biasedExponent := biasedExponent - 1].
	mantissa := mantissa bitShift: shift.
	guess := mantissa bitShift: mantissa highBit + 1 // 2.
	[
		guessSquared := guess * guess.
		delta := guessSquared - mantissa quo: (guess bitShift: 1).
		delta = 0 ] whileFalse:
			[ guess := guess - delta ].
	guessSquared = mantissa
		ifFalse:
			[(guessSquared - guess - mantissa) negative ifFalse: [guess := guess - 1]].
	mantissa := guess.
	biasedExponent := biasedExponent quo: 2.
	self round
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceSubtract: b [
	| delta |
	b isZero ifTrue: [^self round].
	self isZero
		ifTrue:
			[mantissa := b mantissa negated.
			biasedExponent := b biasedExponent]
		ifFalse:
			[biasedExponent = b biasedExponent
				ifTrue: [mantissa := mantissa - b mantissa]
				ifFalse:
					["check for early truncation. beware, keep 2 bits for rounding"

					delta := self exponent - b exponent.
					delta - 2 > (nBits max: self numBitsInMantissa)
						ifFalse:
							[delta negated - 2 > (nBits max: b numBitsInMantissa)
								ifTrue:
									[mantissa := b mantissa negated.
									biasedExponent := b biasedExponent]
								ifFalse:
									[delta := biasedExponent - b biasedExponent.
									delta >= 0
										ifTrue:
											[mantissa := (self shift: mantissa by: delta) - b mantissa.
											biasedExponent := biasedExponent - delta]
										ifFalse: [mantissa := mantissa - (self shift: b mantissa by: delta negated)]]]]].
	self round
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceSubtractNoRound: b [
	| delta |
	b isZero ifTrue: [^self].
	self isZero
		ifTrue:
			[mantissa := b mantissa negated.
			biasedExponent := b biasedExponent]
		ifFalse:
			[delta := biasedExponent - b biasedExponent.
			delta isZero
				ifTrue: [mantissa := mantissa - b mantissa]
				ifFalse:
					[delta >= 0
						ifTrue:
							[mantissa := (self shift: mantissa by: delta) - b mantissa.
							biasedExponent := biasedExponent - delta]
						ifFalse: [mantissa := mantissa - (self shift: b mantissa by: delta negated)]]]
]

{ #category : #private }
PMArbitraryPrecisionFloat >> inPlaceTimesTwoPower: n [
	self isZero
		ifFalse: [biasedExponent := biasedExponent + n]
]

{ #category : #testing }
PMArbitraryPrecisionFloat >> isAnExactFloat [
	^self exponent <= Float emax
		and: [Float emin - Float precision < self exponent
		and: [nBits <= Float precision or: [mantissa isAnExactFloat]]]
]

{ #category : #testing }
PMArbitraryPrecisionFloat >> isZero [
	^mantissa isZero
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> ln [
	"Answer the neperian logarithm of the receiver."

	| x4 one two p res selfHighRes prec e |
	self <= self zero ifTrue: [DomainError signal: 'ln is only defined for x > 0.0'].

	one := self one.
	self = one ifTrue: [^self zero].
	two := one timesTwoPower: 1.

	"Use Salamin algorithm (approximation is good if x is big enough)
		x ln = Pi  / (2 * (1 agm: 4/x) ).
	If x not big enough, compute (x timesTwoPower: p) ln - (2 ln * p)
	if x is close to 1, better use a power expansion"
	prec := nBits + 16.
	e := self exponent.
	e < 0 ifTrue: [e := -1 - e].
	e > prec
		ifTrue: [p := 0]
		ifFalse:
			[p := prec - e.
			prec := prec + p highBit].
	selfHighRes := self asArbitraryPrecisionFloatNumBits: prec.
	(selfHighRes - one) exponent * -4 >= nBits ifTrue: [^(selfHighRes powerExpansionLnPrecision: prec) asArbitraryPrecisionFloatNumBits: nBits].
	self < one ifTrue: [selfHighRes inPlaceReciprocal].	"Use ln(1/x) => - ln(x)"
	x4 := (4 asArbitraryPrecisionFloatNumBits: prec)
				inPlaceDivideBy: selfHighRes;
				inPlaceTimesTwoPower: p negated.
	res := selfHighRes pi / (one agm: x4) timesTwoPower: -1.
	res := selfHighRes = two
		ifTrue: [res / (p + 1)]
		ifFalse: [p = 0 ifTrue: [res] ifFalse: [res - ((two asArbitraryPrecisionFloatNumBits: prec) ln * p)]].
	self < one ifTrue: [res inPlaceNegated].
	^res asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> mantissa [
	^mantissa
]

{ #category : #'initialize-release' }
PMArbitraryPrecisionFloat >> mantissa: m exponent: e nBits: n [
	mantissa := m.
	biasedExponent := e.
	nBits := n.
	self round
]

{ #category : #private }
PMArbitraryPrecisionFloat >> moduloNegPiToPi [
	"answer a copy of the receiver modulo 2*pi, with doubled precision"

	| x pi twoPi quo |
	x := (self asArbitraryPrecisionFloatNumBits: nBits * 2).
	self negative ifTrue: [x inPlaceNegated].
	pi := x pi.
	twoPi := pi timesTwoPower: 1.
	x > pi ifTrue:
		[quo := x + pi quo: twoPi.
		quo highBitOfMagnitude > nBits ifTrue:
			[x := (self abs asArbitraryPrecisionFloatNumBits: nBits + quo highBitOfMagnitude).
			pi := x pi.
			twoPi := pi timesTwoPower: 1.
			quo := x + pi quo: twoPi].
		x inPlaceSubtract: twoPi * quo.
		self negative ifTrue: [x inPlaceNegated]].
	^x asArbitraryPrecisionFloatNumBits: nBits * 2
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> naiveRaisedToInteger: n [
	"Very naive algorithm: use full precision.
	Use only for small n"
	| m e |
	m := mantissa raisedToInteger: n.
	e := biasedExponent * n.
	^(m asArbitraryPrecisionFloatNumBits: nBits) timesTwoPower: e
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> negated [
	^self copy inPlaceNegated
]

{ #category : #testing }
PMArbitraryPrecisionFloat >> negative [
	^mantissa negative
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> nextToward: aNumber [
	"answer the nearest floating point number to self with same precision than self,
	toward the direction of aNumber argument.
	If the nearest one falls on the other side of aNumber, than answer a Number"

	| next |

	"if self is greater, decrease self, but never under aNumber"
	self > aNumber
		ifTrue:
			[next := self predecessor.
			^next >= aNumber
				ifTrue: [next]
				ifFalse: [aNumber]].

	"if self is smaller, increase self, but never above aNumber"
	self < aNumber
		ifTrue: [next := self successor.
			^next <= aNumber
				ifTrue: [next]
				ifFalse: [aNumber]].

	"if we are equal, return self"
	^self
]

{ #category : #private }
PMArbitraryPrecisionFloat >> normalize [
	"normalize the receiver.
	a normalized floating point is either 0, or has mantissa highBit = nBits"

	| delta |
	mantissa isZero
		ifTrue: [biasedExponent := 0]
		ifFalse:
			[self round.
			delta := self numBitsInMantissa - nBits.
			delta < 0
				ifTrue:
					[mantissa := self shift: mantissa by: delta negated.
					biasedExponent := biasedExponent + delta]]
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> numBits [
	^nBits
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> numBitsInMantissa [
	"this is equal to nBits only if we are normalized.
	If we are reduced (low bits being zero are removed), then it will be less.
	If we haven't been rounded/truncated then it will be more"

	^mantissa highBitOfMagnitude
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> one [
	^self class
		mantissa: 1
		exponent: 0
		nBits: nBits
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> pi [
	"answer the value of pi rounded to nBits.
	Note: use the Brent-Salamin Arithmetic Geometric Mean algorithm"

	| a b c k pi oldpi oldExpo expo |
	a := self one asArbitraryPrecisionFloatNumBits: nBits + 16.
	b := (a timesTwoPower: 1) sqrt reciprocal.
	c := a timesTwoPower: -1.
	k := 1.
	oldpi := Float pi.
	oldExpo := 2.

	[| am gm a2 |
	am := a + b timesTwoPower: -1.
	gm := (a * b) sqrt.
	a := am.
	b := gm.
	a2 := a squared.
	c inPlaceSubtract: (a2 - b squared timesTwoPower: k).
	pi := (a2 timesTwoPower: 1) / c.
	expo := (oldpi - pi) exponent.
	expo isZero or: [expo > oldExpo or: [expo < (-1 - nBits)]]]
			whileFalse:
				[oldpi := pi.
				oldExpo := expo.
				k := k + 1].
	^pi asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #testing }
PMArbitraryPrecisionFloat >> positive [
	^mantissa positive
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionArCoshp1Precision: precBits [
	"Evaluate arcosh(x+1)/sqrt(2*x) for the receiver x by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| one two count count2 sum term term1 term2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	count2 := one copy.
	sum := one copy.
	term1 := one copy.
	term2 := one copy.

	[term1 inPlaceMultiplyBy: self.
	term1 inPlaceNegated.
	term2 inPlaceMultiplyBy: count2.
	term2 inPlaceMultiplyBy: count2.
	term2 inPlaceDivideBy: count.
	count inPlaceAdd: one.
	count2 inPlaceAdd: two.
	term2 inPlaceDivideBy: count2.
	term2 inPlaceTimesTwoPower: -2.
	term := term1 * term2.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionArSinhPrecision: precBits [
	"Evaluate the area hypebolic sine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| one x2 two count sum term |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	term inPlaceMultiplyBy: count.
	term inPlaceDivideBy: count + one.
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionArTanhPrecision: precBits [
	"Evaluate the area hyperbolic tangent of the receiver by power series expansion.
	arTanh (x) = x (1 + x^2/3 + x^4/5 + ... ) for -1 < x < 1
	The algorithm is interesting when the receiver is close to zero"

	| one x2 two count sum term |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionArcSinPrecision: precBits [
	"Evaluate the arc sine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| one x2 two count sum term |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	term inPlaceMultiplyBy: count.
	term inPlaceDivideBy: count + one.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionArcTanPrecision: precBits [
	"Evaluate the arc tangent of the receiver by power series expansion.
	arcTan (x) = x (1 - x^2/3 + x^4/5 - ... ) for -1 < x < 1
	The algorithm is interesting when the receiver is close to zero"

	| count one sum term two x2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term / count.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionCosPrecision: precBits [
	"Evaluate the cosine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| count one sum term two x2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionCoshPrecision: precBits [
	"Evaluate the hyperbolic cosine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| count one sum term two x2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := one copy.
	sum := one copy.
	term := one copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionLnPrecision: precBits [
	"Evaluate the neperian logarithm of the receiver by power series expansion.
	For quadratic convergence, use:
	ln ((1+y)/(1-y)) = 2 y (1 + y^2/3 + y^4/5 + ... ) = 2 ar tanh( y )
	(1+y)/(1-y) = self => y = (self-1)/(self+1)
	This algorithm is interesting when the receiver is close to 1"

	| one |
	one := self one.
	^((self - one)/(self + one) powerExpansionArTanhPrecision: precBits) timesTwoPower: 1
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionSinCosPrecision: precBits [
	"Evaluate the sine and cosine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| count one sin cos term |
	one := self one.
	count := one copy.
	cos := one copy.
	sin := self copy.
	term := self copy.

	[count inPlaceAdd: one.
	term
		inPlaceMultiplyBy: self;
		inPlaceDivideBy: count;
		inPlaceNegated.
	cos inPlaceAdd: term.

	count inPlaceAdd: one.
	term
		inPlaceMultiplyBy: self;
		inPlaceDivideBy: count.
	sin inPlaceAdd: term.

	term exponent + precBits < sin exponent] whileFalse.
	^Array with: sin with: cos
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionSinPrecision: precBits [
	"Evaluate the sine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| count one sum term two x2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := two copy.
	sum := self copy.
	term := self copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	term inPlaceNegated.
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionSinhPrecision: precBits [
	"Evaluate the hyperbolic sine of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| count one sum term two x2 |
	one := self one.
	two := one timesTwoPower: 1.
	count := two copy.
	sum := self copy.
	term := self copy.
	x2 := self squared.

	[term inPlaceMultiplyBy: x2.
	term inPlaceDivideBy: count * (count + one).
	count inPlaceAdd: two.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionTanPrecision: precBits [
	"Evaluate the tangent of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| count one sum term pow two x2 seidel |
	one := self one.
	two := one timesTwoPower: 1.
	count := two copy.
	sum := one copy.
	pow := one copy.
	x2 := self squared.
	seidel := OrderedCollection new: 256.
	seidel add: 1.

	[pow inPlaceMultiplyBy: x2.
	pow inPlaceDivideBy: count * (count + one).
	count inPlaceAdd: two.
	2 to: seidel size do: [:i | seidel at: i put: (seidel at: i-1) + (seidel at: i)].
	seidel addLast: seidel last.
	seidel size to: 2 by: -1 do: [:i | seidel at: i - 1 put: (seidel at: i-1) + (seidel at: i)].
	seidel addFirst: seidel first.
	term := pow * seidel first.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum
]

{ #category : #private }
PMArbitraryPrecisionFloat >> powerExpansionTanhPrecision: precBits [
	"Evaluate the hyperbolic tangent of the receiver by power series expansion.
	The algorithm is interesting when the receiver is close to zero"

	| count one sum term pow two x2 seidel |
	one := self one.
	two := one timesTwoPower: 1.
	count := two copy.
	sum := one copy.
	pow := one copy.
	x2 := self squared.
	seidel := OrderedCollection new: 256.
	seidel add: 1.

	[pow inPlaceMultiplyBy: x2.
	pow inPlaceDivideBy: count * (count + one).
	pow inPlaceNegated.
	count inPlaceAdd: two.
	2 to: seidel size do: [:i | seidel at: i put: (seidel at: i-1) + (seidel at: i)].
	seidel addLast: seidel last.
	seidel size to: 2 by: -1 do: [:i | seidel at: i - 1 put: (seidel at: i-1) + (seidel at: i)].
	seidel addFirst: seidel first.
	term := pow * seidel first.
	sum inPlaceAdd: term.
	term exponent + precBits < sum exponent] whileFalse.
	sum inPlaceMultiplyBy: self.
	^sum
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> precision [
	^nBits
]

{ #category : #'truncation and round off' }
PMArbitraryPrecisionFloat >> predecessor [
	mantissa = 0 ifTrue: [^self].
	mantissa negative ifTrue: [^self negated successor negated].
	^mantissa isPowerOfTwo
		ifTrue: [self - (self ulp timesTwoPower: -1)]
		ifFalse: [self - self ulp]
]

{ #category : #printing }
PMArbitraryPrecisionFloat >> printOn: aStream [
	^self printOn: aStream base: 10
]

{ #category : #printing }
PMArbitraryPrecisionFloat >> printOn: aStream base: base [
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		space;
		nextPutAll: #readFrom:;
		space;
		nextPut: $'.
	self negative ifTrue: [aStream nextPut: $-].
	self absPrintExactlyOn: aStream base: base.
	aStream
		nextPut: $';
		space;
		nextPutAll: #readStream;
		space;
		nextPutAll: #numBits:;
		space;
		print: nBits;
		nextPut: $)
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> raisedToInteger: anInteger [
	| bitProbe highPrecisionSelf n result |
	n := anInteger abs.
	(n < 5 or: [n * nBits < 512])
		ifTrue: [^ self naiveRaisedToInteger: anInteger].
	bitProbe := 1 bitShift: n highBit - 1.
	highPrecisionSelf := self asArbitraryPrecisionFloatNumBits: n highBit * 2 + nBits + 2.
	result := highPrecisionSelf one.

	[(n bitAnd: bitProbe) = 0 ifFalse: [result := result * highPrecisionSelf].
	(bitProbe := bitProbe bitShift: -1) > 0]
		whileTrue: [result := result squared].

	^ (anInteger negative
		ifTrue: [result reciprocal]
		ifFalse: [result])
		asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> reciprocal [
	^self copy inPlaceReciprocal
]

{ #category : #private }
PMArbitraryPrecisionFloat >> reduce [
	"remove trailing zero bits from mantissa so that we can do arithmetic on smaller integer
	(that will un-normalize self)"

	| trailing |
	trailing := mantissa abs lowBit - 1.
	trailing > 0
		ifFalse: [ ^ self ].
	mantissa := self shift: mantissa by: trailing negated.
	biasedExponent := biasedExponent + trailing
]

{ #category : #private }
PMArbitraryPrecisionFloat >> round [
	"apply algorithm round to nearest even used by IEEE arithmetic"

	"inexact := ma lowBit <= excess."

	| excess ma carry |
	mantissa isZero
		ifTrue: [
			biasedExponent := 0.
			^ self ].
	ma := mantissa abs.
	excess := ma highBit - nBits.
	excess > 0
		ifFalse: [ ^ self ].
	carry := ma bitAt: excess.
	mantissa := self shift: mantissa by: excess negated.
	biasedExponent := biasedExponent + excess.
	(carry = 1 and: [ mantissa odd or: [ ma lowBit < excess ] ])
		ifFalse: [ ^ self ].
	mantissa := mantissa + mantissa sign.
	self truncate
]

{ #category : #'initialize-release' }
PMArbitraryPrecisionFloat >> setPrecisionTo: n [
	nBits := n.
	self round
]

{ #category : #private }
PMArbitraryPrecisionFloat >> shift: m by: d [
	"shift mantissa m absolute value by some d bits, then restore sign"

	^m negative
		ifTrue: [(m negated bitShift: d) negated]
		ifFalse: [m bitShift: d]
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> sign [
	^mantissa sign
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> significand [
	^self timesTwoPower: self exponent negated
]

{ #category : #accessing }
PMArbitraryPrecisionFloat >> significandAsInteger [
	self normalize.
	^mantissa abs
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> sin [
	^(PMArbitraryPrecisionFloatForTrigonometry
		mantissa: mantissa
		exponent: biasedExponent
		nBits: nBits) sin
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> sincos [
	^(PMArbitraryPrecisionFloatForTrigonometry
		mantissa: mantissa
		exponent: biasedExponent
		nBits: nBits) sincos
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> sinh [
	| e x |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: nBits + 16.
	self exponent * -4 >= nBits
		ifTrue: [^(x powerExpansionSinhPrecision: x numBits) asArbitraryPrecisionFloatNumBits: nBits].
	e := x exp.
	^e
		inPlaceSubtract: e reciprocal;
		inPlaceTimesTwoPower: -1;
		asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> sqrt [
	"Answer the square root of the receiver."

	| decimalPlaces n norm guess previousGuess one stopIteration |
	self negative
		ifTrue:
			[^ DomainError signal: 'sqrt undefined for number less than zero.'].
	self isZero ifTrue: [^self].

	"use additional bits"
	decimalPlaces := nBits + 16.
	n := self asArbitraryPrecisionFloatNumBits: decimalPlaces.

	"constants"
	one := n one.

	"normalize n"
	norm := n exponent quo: 2.
	n := n timesTwoPower: norm * -2.

	"Initial guess for sqrt(1/n)"
	previousGuess := self class
				mantissa: 3
				exponent: -2 - (n exponent quo: 2)
				nBits: decimalPlaces.
	guess := previousGuess copy.

	"use iterations x(k+1) := x*( 1 +  (1-x*x*n)/2) to guess sqrt(1/n)"

	[guess inPlaceMultiplyNoRoundBy: guess.
	guess inPlaceMultiplyBy: n.
	guess inPlaceNegated.
	guess inPlaceAddNoRound: one.

	"stop when no evolution of numBits + 12 first bits"
	stopIteration := guess isZero or: [guess exponent < (decimalPlaces - 4) negated].
	guess inPlaceTimesTwoPower: -1.
	guess inPlaceAddNoRound: one.
	guess inPlaceMultiplyNoRoundBy: previousGuess.
	guess negative ifTrue: [guess inPlaceNegated].

	guess isZero or: [stopIteration]]
			whileFalse:
				[guess round.
				previousGuess inPlaceCopy: guess].

	"multiply by n and un-normalize"
	guess inPlaceMultiplyBy: n.
	guess inPlaceTimesTwoPower: norm.
	^guess asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> squared [
	| result |
	result := self copy.
	result inPlaceMultiplyBy: self.
	^result
]

{ #category : #printing }
PMArbitraryPrecisionFloat >> storeOn: aStream [
	aStream nextPut: $(; nextPutAll: self class name.
	aStream space; nextPutAll: 'mantissa:'; space; print: mantissa.
	aStream space; nextPutAll: 'exponent:'; space; print: biasedExponent.
	aStream space; nextPutAll: 'nBits:'; space; print: nBits.
	aStream nextPut: $)
]

{ #category : #'truncation and round off' }
PMArbitraryPrecisionFloat >> successor [
	mantissa = 0 ifTrue: [^self].
	mantissa negative ifTrue: [^self negated predecessor negated].
	^self + self ulp
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> tan [
	^(PMArbitraryPrecisionFloatForTrigonometry
		mantissa: mantissa
		exponent: biasedExponent
		nBits: nBits) tan
]

{ #category : #'mathematical functions' }
PMArbitraryPrecisionFloat >> tanh [
	| e x ep one |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: nBits + 16.
	self exponent * -4 >= nBits
		ifTrue: [^(x powerExpansionTanhPrecision: x numBits) asArbitraryPrecisionFloatNumBits: nBits].
	e := x exp.
	one :=x one.
	e inPlaceMultiplyBy: e.
	ep := e + one.
	^e
		inPlaceSubtract: one;
		inPlaceDivideBy: ep;
		asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> timesTwoPower: n [
	^ self isZero
		ifTrue: [self]
		ifFalse: [self copy inPlaceTimesTwoPower: n]
]

{ #category : #private }
PMArbitraryPrecisionFloat >> truncate [
	"remove trailing bits if they exceed our allocated number of bits"

	| excess |
	excess := self numBitsInMantissa - nBits.
	excess > 0
		ifFalse: [ ^ self ].
	mantissa := self shift: mantissa by: excess negated.
	biasedExponent := biasedExponent + excess
]

{ #category : #converting }
PMArbitraryPrecisionFloat >> truncated [
	"answer the integer that is nearest to self in the interval between zero and self"

	^biasedExponent negated > self numBitsInMantissa
		ifTrue: [0]
		ifFalse: [self shift: mantissa by: biasedExponent]
]

{ #category : #'truncation and round off' }
PMArbitraryPrecisionFloat >> ulp [
	mantissa = 0 ifTrue: [^self].
	^self one timesTwoPower: self exponent - nBits + 1
]

{ #category : #arithmetic }
PMArbitraryPrecisionFloat >> zero [
	^self class
		mantissa: 0
		exponent: 0
		nBits: nBits
]
