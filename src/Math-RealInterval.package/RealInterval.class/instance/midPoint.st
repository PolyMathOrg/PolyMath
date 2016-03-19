accessing
midPoint
^self isFinite ifTrue: [ sup +inf /2.0 ] ifFalse: [self cutPoint ]