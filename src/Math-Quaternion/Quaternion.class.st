"
Quaternion are to 3D rotations what Complex are to plane rotations.

They are formed with one real part and three unreal parts.
We will note the real part qr, and the unreal part qi*i + qj*j + qk*k, where :
	i*i=j*j=k*k=-1
	i*j=-j*i=k
	j*k=-k*j=i
	k*i=-i*k=j

A 3D rotation of angle theta around axis [u v w] can be associated to quaternion :
	cos(theta/2) + sin(theta/2) * (u i + v j + w k)
Such a quaternion is unitary (have a unit norm)
Product of quaternion is equivalent to product of rotation matrix.
Quaternion conjugate is equivalent to rotation matrix transpose.

A quaternion can also be decomposed into two complex numbers
(qr i: qi) + (qj i: qk) j

Instance Variables:
	qr	<Number>	real part
	qi	<Number>	first unreal part
	qj	<Number>	second unreal part
	qk	<Number>	third unreal part


"
Class {
	#name : #Quaternion,
	#superclass : #Object,
	#instVars : [
		'qr',
		'qi',
		'qj',
		'qk'
	],
	#category : 'Math-Quaternion'
}

{ #category : #'constants access' }
Quaternion class >> one [
	^self 
		qr: 1
		qi: 0
		qj: 0
		qk: 0
]

{ #category : #'instance creation' }
Quaternion class >> qr: qr qi: qi qj: qj qk: qk [ 
	^self basicNew 
		qr: qr
		qi: qi
		qj: qj
		qk: qk
]

{ #category : #'*Math-Quaternion' }
Quaternion class >> random [
		"Answers a random quaternion with abs at most one."

	^ (0.5 - Float random) 
		i: (0.5 - Float random)
		j: (0.5 - Float random)
		k: (0.5 - Float random).
]

{ #category : #'constants access' }
Quaternion class >> zero [
	^self 
		qr: 0
		qi: 0
		qj: 0
		qk: 0
]

{ #category : #arithmetic }
Quaternion >> * aQuaternion [ 
	"Answer the result of multiplying self with aQuaternion.
	Distribute the product (qr + qi i +qj j + qk k)*(tr+ti i + tj j + tk k)
	with rules i*i=j*j=k*k=-1 and i*j=-k, j*k=-i, k*i=-j"
	^ aQuaternion isQuaternion
		ifTrue: [| tr ti tj tk | 
			tr := aQuaternion qr.
			ti := aQuaternion qi.
			tj := aQuaternion qj.
			tk := aQuaternion qk.
			^ self species
				qr: qr * tr - (qi * ti) - (qj * tj) - (qk * tk)
				qi: qr * ti + (qi * tr) + (qj * tk) - (qk * tj)
				qj: qr * tj + (qj * tr) + (qk * ti) - (qi * tk)
				qk: qr * tk + (qk * tr) + (qi * tj) - (qj * ti)]
		ifFalse: [(aQuaternion isNumber and: [aQuaternion isComplexNumber not])
				ifTrue: ["handle case much faster than adapt..."
					self species
						qr: qr * aQuaternion
						qi: qi * aQuaternion
						qj: qj * aQuaternion
						qk: qk * aQuaternion]
				ifFalse: [aQuaternion adaptToQuaternion: self andSend: #*]]
]

{ #category : #arithmetic }
Quaternion >> + aQuaternion [ 
	^ aQuaternion isQuaternion
		ifTrue: [self species
				qr: qr + aQuaternion qr
				qi: qi + aQuaternion qi
				qj: qj + aQuaternion qj
				qk: qk + aQuaternion qk]
		ifFalse: [aQuaternion adaptToQuaternion: self andSend: #+]
]

{ #category : #arithmetic }
Quaternion >> - aQuaternion [ 
	^ aQuaternion isQuaternion
		ifTrue: [self species
				qr: qr - aQuaternion qr
				qi: qi - aQuaternion qi
				qj: qj - aQuaternion qj
				qk: qk - aQuaternion qk]
		ifFalse: [aQuaternion adaptToQuaternion: self andSend: #-]
]

{ #category : #arithmetic }
Quaternion >> / aQuaternion [
	^self * aQuaternion reciprocal
]

{ #category : #comparing }
Quaternion >> = aQuaternion [ 
	"Answer true if both quaternion are equals.
	A quaternion might also equal a Complex or a Number or other kind of numbers.
	Implementation note: only work if Complex Octonion or other kind answer true to isNumber."

	^ aQuaternion isQuaternion
		ifTrue: [qi = aQuaternion qi
				and: [qj = aQuaternion qj
						and: [qk = aQuaternion qk
								and: [qr = aQuaternion qr]]]]
		ifFalse: [aQuaternion isNumber
				and: [aQuaternion adaptToQuaternion: self andSend: #=]]
]

{ #category : #arithmetic }
Quaternion >> abs [
	"Return the magnitude (or absolute value) of the quaternion.
	Care for overflow or underflow"

	| scale |
	scale := (qr abs max: qi abs) max: (qj abs max: qk abs).
	^scale isZero 
		ifTrue: [scale]
		ifFalse: 
			[(self species 
				qr: qr / scale
				qi: qi / scale
				qj: qj / scale
				qk: qk / scale) squaredNorm sqrt * scale]
]

{ #category : #converting }
Quaternion >> adaptToComplex: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Complex, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #converting }
Quaternion >> adaptToFloat: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Float, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #converting }
Quaternion >> adaptToFraction: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Fraction, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #converting }
Quaternion >> adaptToInteger: rcvr andSend: selector [ 
	"If I am involved in arithmetic with an Integer, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #'*Math-Quaternion' }
Quaternion >> addPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99
		
		added to Quaternion 11 May 2012 Daniel Uber
		 "
	^aPolynomial addNumber: self
]

{ #category : #accessing }
Quaternion >> angle [
	"answer the rotation angle associated with the receiver"

	| sinThetaSur2 cosThetaSur2 |
	sinThetaSur2 := self unreal abs.
	cosThetaSur2 := qr.
	^(sinThetaSur2 arcTan: cosThetaSur2) * 2
]

{ #category : #accessing }
Quaternion >> angleInDegrees [
	"answer the rotation angle in degrees associated with the receiver"

	^self angle radiansToDegrees
]

{ #category : #converting }
Quaternion >> asQuaternion [
	"Convert the receiver into a quaternion.
	Do nothing, i am already a quaternion"

	^self
]

{ #category : #arithmetic }
Quaternion >> conjugated [
	"Return the conjugate of this quaternion number."

	^self species 
		qr: qr
		qi: qi negated
		qj: qj negated
		qk: qk negated
]

{ #category : #'mathematical functions' }
Quaternion >> cos [
	"Answer the receiver cosine"

	| z w |
	z := self unreal abs.
	w := z isZero
		ifTrue: [z]
		ifFalse: [qr sin negated * z sinh / z].
	^(self species 
				qr: qr cos * z cosh
				qi: qi * w
				qj: qj * w
				qk: qk * w)
]

{ #category : #'mathematical functions' }
Quaternion >> cosh [
	"Answer the receiver hyperbolic cosine"

	^(self exp + self negated exp) / 2
]

{ #category : #'*Math-Quaternion' }
Quaternion >> dividingPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 "
	^aPolynomial timesNumber: (1 / self)
]

{ #category : #'mathematical functions' }
Quaternion >> exp [
	"Answer the receiver exponential"

	| z w |
	z := self unreal abs.
	w := z isZero
		ifTrue: [z]
		ifFalse: [z sin / z].
	^qr exp * (self species 
				qr: z cos
				qi: qi * w
				qj: qj * w
				qk: qk * w)
]

{ #category : #private }
Quaternion >> floatClass [
	"Answer the class suitable for doing floating point operations.
	In default Squeak, this is Float.
	In an image with single and double IEEE 754 floating point numbers,
	this would depend on the class of real and imaginary parts"

	^Float
]

{ #category : #comparing }
Quaternion >> hash [
	^(((qi hash bitXor: qj hash) bitXor: qk hash) bitXor: qr hash)
]

{ #category : #converting }
Quaternion >> i [
	"Answer the product of the receiver with pure imaginary i.
	This is the same as self * 1 i"

	^self species 
		qr: qi negated
		qi: qr
		qj: qk
		qk: qj negated
]

{ #category : #testing }
Quaternion >> isNumber [
	"Answer true just like Complex, our unreal part is just a bit more complex.
	Note that this message is needed to make equality tests pass due to Number>>= implementation."

	^true
]

{ #category : #testing }
Quaternion >> isQuaternion [
	"always answer true since the receiver is a quaternion"

	^true
]

{ #category : #testing }
Quaternion >> isZero [
	"answer true if the receiver is null, false otherwise"

	^qr isZero and: [qi isZero and: [qj isZero and: [qk isZero]]]
]

{ #category : #converting }
Quaternion >> j [
	"Answer the product of the receiver with pure imaginary j.
	This is the same as self * 1 j"


	^self species 
		qr: qj negated
		qi: qk negated
		qj: qr
		qk: qi
]

{ #category : #converting }
Quaternion >> k [
	"Answer the product of the receiver with pure imaginary k.
	This is the same as self * 1 k"


	^self species 
		qr: qk negated
		qi: qj
		qj: qi negated
		qk: qr
]

{ #category : #'mathematical functions' }
Quaternion >> ln [
	"Answer the receiver natural logarithm"

	| z |
	z := self unreal abs.
	^z isZero 
		ifTrue: 
			[self species 
				qr: self abs ln
				qi: (z arcTan: qr)
				qj: 0
				qk: 0]
		ifFalse: 
			[| theta |
			theta := (z arcTan: qr) / z.
			self species 
				qr: self abs ln
				qi: qi * theta
				qj: qj * theta
				qk: qk * theta]
]

{ #category : #'mathematical functions' }
Quaternion >> log [
	"Answer receiver base 10 logarithm."

	^self ln / 10 ln
]

{ #category : #arithmetic }
Quaternion >> negated [
	^self species 
		qr: qr negated
		qi: qi negated
		qj: qj negated
		qk: qk negated
]

{ #category : #printing }
Quaternion >> printOn: aStream [ 
	"Print a representation of the receiver onto aStream"

	self storeOn: aStream
]

{ #category : #'*Math-Quaternion' }
Quaternion >> productWithVector: aVector [
		"Answers a new vector product of the receiver with aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	^aVector collect: [ :each | each * self]
]

{ #category : #accessing }
Quaternion >> qi [
	^qi
]

{ #category : #accessing }
Quaternion >> qj [
	^qj
]

{ #category : #accessing }
Quaternion >> qk [
	^qk
]

{ #category : #accessing }
Quaternion >> qr [
	^qr
]

{ #category : #private }
Quaternion >> qr: a0 qi: a1 qj: a2 qk: a3 [ 
	qr := a0.
	qi := a1.
	qj := a2.
	qk := a3
]

{ #category : #'mathematical functions' }
Quaternion >> raisedTo: aNumber [ 
	"Answer the receiver raised to aNumber."

	aNumber isInteger ifTrue:
		["Do the special case of integer power"
		^ self raisedToInteger: aNumber].
	
	0 = aNumber ifTrue: [^ self class one].	"Special case of exponent=0"
	1 = aNumber ifTrue: [^ self].	"Special case of exponent=1"
	0 = self ifTrue: [				"Special case of self = 0"
		aNumber < 0
			ifTrue: [^ (ZeroDivide dividend: self) signal]
			ifFalse: [^ self]].
	^ (aNumber * self ln) exp		"Otherwise use logarithms"
]

{ #category : #'mathematical functions' }
Quaternion >> raisedToInteger: operand [ 
	"Answer the receiver raised to the power operand, an Integer."

	"implementation note: this code is copied from Number.
	This suggest that both Number and Quaternion should have an
	ArithmeticValue common superclass like in Visualworks.
	Or maybe should it be a Traits (a property of fields ?)"

	| count result |
	operand isInteger ifFalse: [^ ArithmeticError signal: 'parameter is not an Integer'].
	operand = 0 ifTrue: [^ self class one].
	operand = 1 ifTrue: [^ self].
	operand < 0 ifTrue: [^ (self raisedToInteger: operand negated) reciprocal].
	count := 1 bitShift: (operand-1) highBit.
	result := self class one.
	[count > 0]
		whileTrue: 
			[result := result * result.
			(operand bitAnd: count)
				= 0 ifFalse: [result := result * self].
			count := count bitShift: -1].
	^ result
]

{ #category : #'*Math-Quaternion' }
Quaternion >> random [
	"analog to Number>>random. The resulting quaternion will have abs at most that of the receiver"
	^ self class random * self.
]

{ #category : #accessing }
Quaternion >> real [
	"answer the real part of the receiver"

	^qr
]

{ #category : #arithmetic }
Quaternion >> reciprocal [
	"Trivial algorithm:
		^self conjugated / self squaredNorm
	may overflow"

	| qn qrn qin qjn qkn qn2 |
	qn := (qr abs max: qi abs) max: (qj abs max: qk abs).
	qn isZero 
		ifTrue: 
			[^ZeroDivide signal: 'Cannot take reciprocal of null quaternion'].
	qrn := qr / qn.
	qin := qi / qn.
	qjn := qj / qn.
	qkn := qk / qn.
	qn2 := qrn squared + qin squared + qjn squared + qkn squared.
	^(qrn / (qn*qn2) i: qin negated / (qn*qn2) j: qjn negated / (qn*qn2) k: qkn negated / (qn*qn2))
]

{ #category : #converting }
Quaternion >> reduce [
	"Answer the receiver transformed to a lower generality, if
	such a transformation is possible without losing information.
	If not, answer the receiver"
	^(qj isZero and: [qk isZero])
		ifFalse: [self]
		ifTrue: [qi isZero
			ifTrue: [qr]
			ifFalse: [qr i: qi]]
]

{ #category : #'mathematical functions' }
Quaternion >> sin [
	"Answer the receiver sine"

	| z w |
	z := self unreal abs.
	w := z isZero
		ifTrue: [z]
		ifFalse: [qr cos * z sinh / z].
	^(self species 
				qr: qr sin * z cosh
				qi: qi * w
				qj: qj * w
				qk: qk * w)
]

{ #category : #'mathematical functions' }
Quaternion >> sinh [
	"Answer the receiver hyperbolic sine"

	^(self exp - self negated exp) / 2
]

{ #category : #'mathematical functions' }
Quaternion >> squared [
	^self * self
]

{ #category : #arithmetic }
Quaternion >> squaredNorm [
	^qr squared + qi squared + qj squared + qk squared
]

{ #category : #printing }
Quaternion >> storeOn: aStream [ 
	"Store a representation of the receiver onto aStream that can be interpreted.
	Two possible forms are:
	a + b i + c j + d k
	a i: b j: c k: d
	Second one is preferred for efficiency"

	aStream nextPut: $(.
	qr storeOn: aStream.
	aStream
		space;
		nextPutAll: #i:;
		space.
	qi storeOn: aStream.
	aStream
		space;
		nextPutAll: #j:;
		space.
	qj storeOn: aStream.
	aStream
		space;
		nextPutAll: #k:;
		space.
	qk storeOn: aStream.
	aStream nextPut: $)
]

{ #category : #'*Math-Quaternion' }
Quaternion >> subtractToPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99 "
	^aPolynomial addNumber: self negated
]

{ #category : #'mathematical functions' }
Quaternion >> tan [
	"Answer the receiver tangent"

	^self sin / self cos
]

{ #category : #'mathematical functions' }
Quaternion >> tanh [
	"Answer the hyperbolic tangent"

	| ep em |
	ep := self exp.
	em := self negated exp.
	^(ep - em) / (ep + em)
]

{ #category : #'*Math-Quaternion' }
Quaternion >> timesPolynomial: aPolynomial [
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/4/99 
		added to Complex class 12 May 2012, Daniel Uber
		"
	^aPolynomial timesNumber: self
]

{ #category : #accessing }
Quaternion >> unreal [
	"answer the unreal part of the receiver"

	^self species 
		qr: 0
		qi: qi
		qj: qj
		qk: qk
]
