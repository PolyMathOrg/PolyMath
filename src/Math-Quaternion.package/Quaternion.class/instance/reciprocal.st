arithmetic
reciprocal
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