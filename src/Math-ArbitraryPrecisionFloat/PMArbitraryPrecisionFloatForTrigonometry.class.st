"
PMArbitraryPrecisionFloatForTrigonometry is a private helper class involved in trigonometry computations.

Instance Variables
	pi	<ArbitraryPrecisionFloat>	

pi
	- an approximation of number pi with doubled precision

"
Class {
	#name : #PMArbitraryPrecisionFloatForTrigonometry,
	#superclass : #PMArbitraryPrecisionFloat,
	#instVars : [
		'pi'
	],
	#category : #'Math-ArbitraryPrecisionFloat'
}

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> cos [
	"Evaluate the cosine of the receiver"

	| halfPi quarterPi x neg |
	x := self moduloNegPiToPi.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	(neg := x > halfPi) ifTrue: [
		x
			inPlaceSubtract: pi;
			inPlaceNegated ].
	quarterPi := halfPi timesTwoPower: -1.
	x := x > quarterPi
		     ifTrue: [
			     x
				     inPlaceSubtract: halfPi;
				     inPlaceNegated.
			     self sin: x ]
		     ifFalse: [ self cos: x ].
	neg ifTrue: [ x inPlaceNegated ].
	^ x asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> cos: x [
	"Evaluate the cosine of x by recursive cos(2x) formula and power series expansion.
	Note that it is better to use this method with x <= pi/4."
	
	| one cos fraction power |
	x isZero ifTrue: [^x one].
	power := ((nBits bitShift: -1) + x exponent max: 0) highBit.
	fraction := x timesTwoPower: power negated.
	cos := fraction powerExpansionCosPrecision: nBits + (1 bitShift: 1 + power).
	one := x one.
	power timesRepeat:
		["Evaluate cos(2x)=2 cos(x)^2-1"
		cos inPlaceMultiplyBy: cos; inPlaceTimesTwoPower: 1; inPlaceSubtract: one].
	^cos
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> moduloNegPiToPi [
	"answer a copy of the receiver modulo 2*pi, with doubled precision"

	| x quo twoPi |
	x := (PMArbitraryPrecisionFloat
		mantissa: mantissa abs
		exponent: biasedExponent
		nBits: nBits * 2 + 16).
	pi := x pi.
	twoPi := pi timesTwoPower: 1.
	x > pi ifTrue:
		[quo := x + pi quo: twoPi.
		quo highBit * 2 > nBits ifTrue:
			[x := (PMArbitraryPrecisionFloat
				mantissa: mantissa abs
				exponent: biasedExponent
				nBits: nBits * 3 // 2 + quo highBit + 16).
			pi := x pi.
			twoPi := pi timesTwoPower: 1.
			quo := x + pi quo: twoPi].
		x inPlaceSubtract: twoPi * quo].
	self negative ifTrue: [x inPlaceNegated].
	^x asArbitraryPrecisionFloatNumBits: nBits * 2 + 16
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> pi [
	"Answer an approximation of pi with doubled precision."

	^pi ifNil: [ pi := (PMArbitraryPrecisionFloat
		mantissa: 0
		exponent: 0
		nBits: nBits * 2 + 2) pi ]
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> sin [
	"Evaluate the sine of the receiver"

	| halfPi quarterPi x neg |
	x := self moduloNegPiToPi.
	neg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	x > halfPi ifTrue: [
		x
			inPlaceSubtract: pi;
			inPlaceNegated ].
	quarterPi := halfPi timesTwoPower: -1.
	x := x > quarterPi
		     ifTrue: [
			     x
				     inPlaceSubtract: halfPi;
				     inPlaceNegated.
			     self cos: x ]
		     ifFalse: [ self sin: x ].
	neg ifTrue: [ x inPlaceNegated ].
	^ x asArbitraryPrecisionFloatNumBits: nBits
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> sin: x [
	"Evaluate the sine of x by sin(5x) formula and power series expansion."
	
	| sin sin2 sin4 fifth five |
	x isZero ifTrue: [^x zero].
	five := 5 asArbitraryPrecisionFloatNumBits: x numBits.
	fifth := x / five.
	sin := fifth powerExpansionSinPrecision: nBits + 8.
	sin2 := sin squared.
	sin2 inPlaceTimesTwoPower: 2.
	sin4 := sin2 squared.
	sin2 inPlaceMultiplyBy: five.
	^sin4
		inPlaceSubtract: sin2;
		inPlaceAdd: five;
		inPlaceMultiplyBy: sin;
		yourself
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> sincos [
	"Evaluate the sine and cosine of the receiver"

	| halfPi quarterPi x sincos sinneg cosneg |
	x := self moduloNegPiToPi.
	sinneg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	(cosneg := x > halfPi) ifTrue: [
		x
			inPlaceSubtract: pi;
			inPlaceNegated ].
	quarterPi := halfPi timesTwoPower: -1.
	sincos := x > quarterPi
		          ifTrue: [
			          x
				          inPlaceSubtract: halfPi;
				          inPlaceNegated.
			          (self sincos: x) reversed ]
		          ifFalse: [ self sincos: x ].
	sinneg ifTrue: [ sincos first inPlaceNegated ].
	cosneg ifTrue: [ sincos last inPlaceNegated ].
	^ sincos collect: [ :e | e asArbitraryPrecisionFloatNumBits: nBits ]
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> sincos: x [
	"Evaluate the sine and cosine of x by recursive sin(2x) and cos(2x) formula and power series expansion.
	Note that it is better to use this method with x <= pi/4."
	
	| one sin cos sincos fraction power |
	x isZero ifTrue: [^Array with: x zero with: x one].
	power := ((nBits bitShift: -1) + x exponent max: 0) highBit.
	fraction := x timesTwoPower: power negated.
	sincos := fraction powerExpansionSinCosPrecision: nBits + (1 bitShift: 1 + power).
	sin := sincos first.
	cos := sincos last.
	one := x one.
	power timesRepeat:
		["Evaluate sin(2x)=2 sin(x) cos(x)"
		sin inPlaceMultiplyBy: cos; inPlaceTimesTwoPower: 1.
		"Evaluate cos(2x)=2 cos(x)^2-1"
		cos inPlaceMultiplyBy: cos; inPlaceTimesTwoPower: 1; inPlaceSubtract: one].
	^sincos
]

{ #category : #private }
PMArbitraryPrecisionFloatForTrigonometry >> tan [
	"Evaluate the tangent of the receiver"

	| halfPi quarterPi x sincos neg tan |
	x := self moduloNegPiToPi.
	neg := x negative.
	x inPlaceAbs.
	halfPi := pi timesTwoPower: -1.
	x > halfPi ifTrue: [
		x
			inPlaceSubtract: pi;
			inPlaceNegated.
		neg := neg not ].
	tan := x exponent * -4 >= nBits
		       ifTrue: [ x powerExpansionTanPrecision: x numBits ]
		       ifFalse: [
			       quarterPi := halfPi timesTwoPower: -1.
			       sincos := x > quarterPi
				                 ifTrue: [
					                 x
						                 inPlaceSubtract: halfPi;
						                 inPlaceNegated.
					                 (self sincos: x) reversed ]
				                 ifFalse: [ self sincos: x ].
			       sincos first inPlaceDivideBy: sincos last.
			       sincos first ].
	neg ifTrue: [ tan inPlaceNegated ].
	^ tan asArbitraryPrecisionFloatNumBits: nBits
]
