accessing
desiredPrecision: aNumber
aNumber > 0
		ifFalse: [ ^self error: 'precision too low'].
^ myDesiredPrec :=aNumber