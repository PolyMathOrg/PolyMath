private
testRate:aFloat oldRate: asecondFloat name:aString
(aFloat between: 0 and: 1) ifFalse: [(DomainError new)from:0;to:1;messageText: 'Value outside [0 , 1]';signalIn: thisContext sender].
(rateOfCrossover + rateOfMutation + rateOfLC + rateOfEir + aFloat - asecondFloat)>1.000000000000001 "for Float inaccuracies"
	ifTrue: [Warning  signal:'All rates together are higher than 1, if ' , aString, ' is set to ',aFloat asString ].