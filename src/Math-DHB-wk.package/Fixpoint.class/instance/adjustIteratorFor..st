private
adjustIteratorFor: aCycleLength
"adjusts also result & result1"
1 to: results size do:[:i| |last| last:=i + aCycleLength. 
	((results at:i)literalEqual:(results at:last)) 
		ifTrue: [	result := results at:i.
					result1 :=result.
					^iterations :=last - 1]]