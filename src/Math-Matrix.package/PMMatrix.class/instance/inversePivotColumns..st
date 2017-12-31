as yet unclassified
inversePivotColumns: anArray
	"uses vector encoding of an interchange permutation matrix  in anArray as in qrFactorizationWithPivoting. Does inverse pivoting!"
	| res |
	res :=self deepCopy.
	anArray reverseWith: (1 to: anArray size ) do:  [ :piv :ind | piv ~= ind ifTrue: [res swapColumn: piv withColumn: ind ] ].
	^ res