accessing
midPoint
"midpoint is always an element of self, while cut point usually isn't!"
^self isFinite ifTrue: [ self privateMidPoint ] ifFalse: [self projectionFrom: self cutPoint ]