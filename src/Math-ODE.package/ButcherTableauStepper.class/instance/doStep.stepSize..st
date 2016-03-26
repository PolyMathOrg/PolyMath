as yet unclassified
doStep: aStateTime stepSize: dt
	"not complete"
	| stages stageCount stateDifference|
	self isInitialized.
	stageCount := stageIncrements size.
	stages := Array new: stageCount.
	(1 to: stageCount) do:
	[:i | | sum |
		sum ifNil: [sum := 0]. 
		(1 to:  i - 1) do: 
			[:j | sum := sum + ((stages at: j ) * stageCoefficients at: i at: j)].
	stages at: i put:  
		(system 
			state: aStateTime state +  (dt * sum)  
			time: aStateTime time + (dt * stageIncrements at: i) )].
	stateDifference := (dt * ((1 to: stageCount) do: [:i | | sum | 
			sum ifNil: [sum := 0].
			sum := sum + (( stageWeights at: i) * (stages at: i)) ])).
	^ aStateTime state + stateDifference.