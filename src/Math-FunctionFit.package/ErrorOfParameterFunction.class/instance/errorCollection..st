accessing
errorCollection: parameters
"returns a collection of squared errors or of abs errors"
"this is used often and should and could be a bit optimized"
	|y y1|
	parameters withIndexDo: [ :p :i | varArray at: i + 1 put: p ].
	^data
		collect: [ :point | 
			| err|
			varArray at: 1 put: point x.
			y := point y.
			y1 :=function valueWithArguments: varArray.
			err :=y1-y.
			relative
				ifTrue: [
					err := ((y1 = 0)or:[y=0])
						ifTrue: [ (y=y1) ifTrue: [0] ifFalse: [1]]
						ifFalse: [ errorType = #squared 
							ifTrue: [ err squared / y1 abs  + (err squared  /y abs) / 2] 	"this looks even more stupid than the rest of the 'relative ifTrue:' code, but it is necessary to do it this way because of the possible bias"
							ifFalse: [(err / y)abs +(err /y1)abs /2 ] ] ]	
				ifFalse:[ errorType = #squared
					ifTrue: [ err squared ]
					ifFalse: [ err abs ] ]].
