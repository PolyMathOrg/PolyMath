instance creation
fromNumber: aNumber
|n|
n:= aNumber asNumber .
^n isInfinite ifTrue: [self new] ifFalse: [super new inf: n;yourself] 