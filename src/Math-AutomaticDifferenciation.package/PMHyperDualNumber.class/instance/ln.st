mathematical functions
ln
|v|
v :=value.
v=0 ifTrue:[v:=self class zeroApproximation ].
^(super ln) eps2: eps2/v; eps1eps2: eps1eps2/v -(eps * eps2 / v squared );yourself
