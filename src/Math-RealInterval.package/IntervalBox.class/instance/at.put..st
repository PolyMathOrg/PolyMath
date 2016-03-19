accessing
at: anInteger put: anObject 
^anObject isNumber 
	ifTrue: [ super at: anInteger  put: (RealInterval fromNumber: anObject) ] 
	ifFalse:[super at: anInteger  put:anObject ] 