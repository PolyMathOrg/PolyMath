*Math-RealIntervalCompatibility
max: anObject 
^(anObject isKindOf: Magnitude)  ifTrue: [ super max: anObject ] ifFalse: [ anObject adaptToNumber: self andSend: #max: ]