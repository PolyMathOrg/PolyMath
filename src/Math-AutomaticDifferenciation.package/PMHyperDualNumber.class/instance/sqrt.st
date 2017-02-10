mathematical functions
sqrt
|d d2|
d:=2 *  value sqrt.
d2:=4* (value raisedTo: (3/2)).
d=0 ifTrue:[
	d:=self class zeroApproximation.
	d2:=4* ((self class zeroApproximation) raisedTo: (3/2)) ].
^(super sqrt) eps2: eps2/d; eps1eps2: eps1eps2/d -(eps * eps2 / d2);yourself
