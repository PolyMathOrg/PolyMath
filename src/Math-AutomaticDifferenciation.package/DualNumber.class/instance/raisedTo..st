mathematical functions
raisedTo: aDualNumber
|v|
value=0 ifTrue:[^DualNumber value:0].
v:=value raisedTo: aDualNumber value.
aDualNumber isDualNumber
	ifFalse:[^self class value: v eps: v / value * eps * aDualNumber].
^self class value: v eps: v * (eps * aDualNumber value / value + (aDualNumber eps * value ln ))
