instance creation
fromNumber: aNumber withUncertainty: d
|u|
u:=d abs.
^aNumber isInfinite ifTrue: [self new] ifFalse: [super new inf: aNumber- u;sup: aNumber + u;yourself] 