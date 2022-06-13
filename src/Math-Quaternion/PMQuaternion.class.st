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
	#name : #PMQuaternion,
	#superclass : #Object,
	#instVars : [
		'qr',
		'qi',
		'qj',
		'qk'
	],
	#category : #'Math-Quaternion'
}

{ #category : #'constants access' }
PMQuaternion class >> one [
	^self 
		qr: 1
		qi: 0
		qj: 0
		qk: 0
]

{ #category : #'instance creation' }
PMQuaternion class >> qr: qr qi: qi qj: qj qk: qk [ 
	^self basicNew 
		qr: qr
		qi: qi
		qj: qj
		qk: qk
]

{ #category : #'*Math-Quaternion' }
PMQuaternion class >> random [
	"Answers a random quaternion with abs at most one."
	
	| random |
	random := Random new.

	^ (0.5 - random next) 
		i: (0.5 - random next)
		j: (0.5 - random next)
		k: (0.5 - random next).
]

{ #category : #'constants access' }
PMQuaternion class >> zero [
	^self 
		qr: 0
		qi: 0
		qj: 0
		qk: 0
]

{ #category : #arithmetic }
PMQuaternion >> * multiplier [

	"Answer the result of multiplying self with aQuaternion.
	Distribute the product (qr + qi i +qj j + qk k)*(tr+ti i + tj j + tk k)
	with rules i*i=j*j=k*k=-1 and i*j=-k, j*k=-i, k*i=-j"

	^ multiplier isQuaternion
		  ifTrue: [ 
			  | tr ti tj tk |
			  tr := multiplier qr.
			  ti := multiplier qi.
			  tj := multiplier qj.
			  tk := multiplier qk.
			  ^ self species
				    qr: qr * tr - (qi * ti) - (qj * tj) - (qk * tk)
				    qi: qr * ti + (qi * tr) + (qj * tk) - (qk * tj)
				    qj: qr * tj + (qj * tr) + (qk * ti) - (qi * tk)
				    qk: qr * tk + (qk * tr) + (qi * tj) - (qj * ti) ]
		  ifFalse: [ 
			  (multiplier isNumber and: [ multiplier isComplexNumber not ])
				  ifTrue: [ "handle case much faster than adapt..."
					  self species
						  qr: qr * multiplier
						  qi: qi * multiplier
						  qj: qj * multiplier
						  qk: qk * multiplier ]
				  ifFalse: [ multiplier adaptToQuaternion: self andSend: #* ] ]
]

{ #category : #arithmetic }
PMQuaternion >> + aQuaternion [ 
	^ aQuaternion isQuaternion
		ifTrue: [self species
				qr: qr + aQuaternion qr
				qi: qi + aQuaternion qi
				qj: qj + aQuaternion qj
				qk: qk + aQuaternion qk]
		ifFalse: [aQuaternion adaptToQuaternion: self andSend: #+]
]

{ #category : #arithmetic }
PMQuaternion >> - aQuaternion [ 
	^ aQuaternion isQuaternion
		ifTrue: [self species
				qr: qr - aQuaternion qr
				qi: qi - aQuaternion qi
				qj: qj - aQuaternion qj
				qk: qk - aQuaternion qk]
		ifFalse: [aQuaternion adaptToQuaternion: self andSend: #-]
]

{ #category : #arithmetic }
PMQuaternion >> / aQuaternion [
	^self * aQuaternion reciprocal
]

{ #category : #comparing }
PMQuaternion >> = aQuaternion [ 
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
PMQuaternion >> abs [
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
PMQuaternion >> adaptToComplex: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Complex, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #converting }
PMQuaternion >> adaptToFloat: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Float, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #converting }
PMQuaternion >> adaptToFraction: rcvr andSend: selector [ 
	"If I am involved in arithmetic with a Fraction, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #converting }
PMQuaternion >> adaptToInteger: rcvr andSend: selector [ 
	"If I am involved in arithmetic with an Integer, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> addPolynomial: aPolynomial [
	^aPolynomial addNumber: self
]

{ #category : #accessing }
PMQuaternion >> angle [
	"answer the rotation angle associated with the receiver"

	| sinThetaSur2 cosThetaSur2 |
	sinThetaSur2 := self unreal abs.
	cosThetaSur2 := qr.
	^(sinThetaSur2 arcTan: cosThetaSur2) * 2
]

{ #category : #accessing }
PMQuaternion >> angleInDegrees [
	"answer the rotation angle in degrees associated with the receiver"

	^self angle radiansToDegrees
]

{ #category : #converting }
PMQuaternion >> asQuaternion [
	"Convert the receiver into a quaternion.
	Do nothing, i am already a quaternion"

	^self
]

{ #category : #arithmetic }
PMQuaternion >> conjugated [
	"Return the conjugate of this quaternion number."

	^self species 
		qr: qr
		qi: qi negated
		qj: qj negated
		qk: qk negated
]

{ #category : #'mathematical functions' }
PMQuaternion >> cos [
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
PMQuaternion >> cosh [
	"Answer the receiver hyperbolic cosine"

	^(self exp + self negated exp) / 2
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> dividingPolynomial: aPolynomial [
	^aPolynomial timesNumber: (1 / self)
]

{ #category : #'mathematical functions' }
PMQuaternion >> exp [
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
PMQuaternion >> floatClass [
	"Answer the class suitable for doing floating point operations.
	In default Squeak, this is Float.
	In an image with single and double IEEE 754 floating point numbers,
	this would depend on the class of real and imaginary parts"

	^Float
]

{ #category : #comparing }
PMQuaternion >> hash [
	^(((qi hash bitXor: qj hash) bitXor: qk hash) bitXor: qr hash)
]

{ #category : #converting }
PMQuaternion >> i [
	"Answer the product of the receiver with pure imaginary i.
	This is the same as self * 1 i"

	^self species 
		qr: qi negated
		qi: qr
		qj: qk
		qk: qj negated
]

{ #category : #testing }
PMQuaternion >> isNumber [
	"Answer true just like Complex, our unreal part is just a bit more complex.
	Note that this message is needed to make equality tests pass due to Number>>= implementation."

	^true
]

{ #category : #testing }
PMQuaternion >> isQuaternion [
	"always answer true since the receiver is a quaternion"

	^true
]

{ #category : #testing }
PMQuaternion >> isZero [
	"answer true if the receiver is null, false otherwise"

	^qr isZero and: [qi isZero and: [qj isZero and: [qk isZero]]]
]

{ #category : #converting }
PMQuaternion >> j [
	"Answer the product of the receiver with pure imaginary j.
	This is the same as self * 1 j"


	^self species 
		qr: qj negated
		qi: qk negated
		qj: qr
		qk: qi
]

{ #category : #converting }
PMQuaternion >> k [
	"Answer the product of the receiver with pure imaginary k.
	This is the same as self * 1 k"


	^self species 
		qr: qk negated
		qi: qj
		qj: qi negated
		qk: qr
]

{ #category : #'mathematical functions' }
PMQuaternion >> ln [

	"Compute the natural logarithm."

	| z |
	z := self unreal abs.
	^ z isZero
		  ifTrue: [ 
			  | vectorPart |
			  vectorPart := 0 + (z arcTan: qr) i + qj j + qk k.
			  self abs ln + vectorPart ]
		  ifFalse: [ 
			  | theta vectorPart |
			  theta := (z arcTan: qr) / z.
			  vectorPart := theta * (0 + qi i + qj j + qk k).
			  self abs ln + vectorPart ]
]

{ #category : #'mathematical functions' }
PMQuaternion >> log [
	"Answer receiver base 10 logarithm."

	^self ln / 10 ln
]

{ #category : #arithmetic }
PMQuaternion >> negated [
	^self species 
		qr: qr negated
		qi: qi negated
		qj: qj negated
		qk: qk negated
]

{ #category : #printing }
PMQuaternion >> printOn: aStream [ 
	"Print a representation of the receiver onto aStream"

	self storeOn: aStream
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> productWithVector: aVector [
		"Answers a new vector product of the receiver with aVector."
	^aVector collect: [ :each | each * self]
]

{ #category : #accessing }
PMQuaternion >> qi [
	^qi
]

{ #category : #accessing }
PMQuaternion >> qj [
	^qj
]

{ #category : #accessing }
PMQuaternion >> qk [
	^qk
]

{ #category : #accessing }
PMQuaternion >> qr [
	^qr
]

{ #category : #private }
PMQuaternion >> qr: a0 qi: a1 qj: a2 qk: a3 [ 
	qr := a0.
	qi := a1.
	qj := a2.
	qk := a3
]

{ #category : #'mathematical functions' }
PMQuaternion >> raisedTo: aNumber [ 
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
PMQuaternion >> raisedToInteger: operand [ 
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
PMQuaternion >> random [
	"analog to Number>>random. The resulting quaternion will have abs at most that of the receiver"
	^ self class random * self.
]

{ #category : #accessing }
PMQuaternion >> real [
	"answer the real part of the receiver"

	^qr
]

{ #category : #arithmetic }
PMQuaternion >> reciprocal [
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
PMQuaternion >> reduce [
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
PMQuaternion >> sin [
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
PMQuaternion >> sinh [
	"Answer the receiver hyperbolic sine"

	^(self exp - self negated exp) / 2
]

{ #category : #'mathematical functions' }
PMQuaternion >> squared [
	^self * self
]

{ #category : #arithmetic }
PMQuaternion >> squaredNorm [
	^qr squared + qi squared + qj squared + qk squared
]

{ #category : #printing }
PMQuaternion >> storeOn: aStream [ 
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
PMQuaternion >> subtractToPolynomial: aPolynomial [
	^aPolynomial addNumber: self negated
]

{ #category : #'mathematical functions' }
PMQuaternion >> tan [
	"Answer the receiver tangent"

	^self sin / self cos
]

{ #category : #'mathematical functions' }
PMQuaternion >> tanh [
	"Answer the hyperbolic tangent"

	| ep em |
	ep := self exp.
	em := self negated exp.
	^(ep - em) / (ep + em)
]

{ #category : #'*Math-Quaternion' }
PMQuaternion >> timesPolynomial: aPolynomial [
	^aPolynomial timesNumber: self
]

{ #category : #accessing }
PMQuaternion >> unreal [
	"answer the unreal part of the receiver"

	^self species 
		qr: 0
		qi: qi
		qj: qj
		qk: qk
]
