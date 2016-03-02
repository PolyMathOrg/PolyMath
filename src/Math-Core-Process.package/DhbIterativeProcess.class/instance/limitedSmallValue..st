private
limitedSmallValue: aNumber
	"Private - prevent aNumber from being smaller in absolute value than a small number."
	^aNumber abs < DhbFloatingPointMachine new smallNumber
			ifTrue: [ DhbFloatingPointMachine new smallNumber]
			ifFalse:[ aNumber]