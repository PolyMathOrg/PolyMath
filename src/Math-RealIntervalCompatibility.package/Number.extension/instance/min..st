*Math-RealIntervalCompatibility
min: anObject 
^(anObject isKindOf: Magnitude)  ifTrue: [ super min: anObject ] ifFalse: [ anObject adaptToNumber: self andSend: #min: ]