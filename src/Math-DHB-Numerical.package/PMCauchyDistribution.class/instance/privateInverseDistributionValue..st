information
privateInverseDistributionValue: aNumber
	"Private - Answer the number whose acceptance is aNumber."
	^aNumber =0 
		ifTrue:[Float infinity negated] 
		ifFalse: [aNumber =1 
			ifTrue:[Float infinity ] 
			ifFalse:[( ( aNumber - (1 / 2)) * Float pi) tan * beta + mu]].