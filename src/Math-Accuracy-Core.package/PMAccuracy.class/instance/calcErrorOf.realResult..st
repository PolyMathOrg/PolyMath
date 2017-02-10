private
calcErrorOf: aResult realResult: aRResult
	^ aResult = 0 
		ifTrue: [aRResult =0 
			ifTrue: [0] 
			ifFalse: [aRResult >0 
				ifTrue: [ Float infinity]
				ifFalse: [Float infinity negated ]]] 
		ifFalse:[ 100.0 * ( aRResult - aResult ) /aResult ]