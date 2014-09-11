printing
format: aCollection type: aString postfix: pf tree: aTree
	self format: aCollection type: aString postfix: pf.
	aTree at:aString put: (aCollection size=1 ifTrue:[aCollection first] ifFalse:[aCollection]).
	^aStream 