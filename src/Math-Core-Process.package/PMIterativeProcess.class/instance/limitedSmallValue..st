private
limitedSmallValue: aNumber
	"Private - prevent aNumber from being smaller in absolute value than a small number."
	^aNumber abs < PMFloatingPointMachine new smallNumber
			ifTrue: [ PMFloatingPointMachine new smallNumber]
			ifFalse:[ aNumber]