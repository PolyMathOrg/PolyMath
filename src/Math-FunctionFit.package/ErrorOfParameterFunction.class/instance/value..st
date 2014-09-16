evaluating
value: parameters
	"returns the sum of squared errors, or the sum of abs errors, or the quartile error. insensitive is an experimental quartile error that centers a tube around its quartile and returns the (estimated) radius of the tube like quartile"

	| e|
	e := self errorCollection: parameters .
	errorType = #quartile
		ifTrue: [ ^ e asSortedCollection at: qPosition ]
		ifFalse: [ 
			errorType = #insensitive
				ifTrue: [ 
					e := e asSortedCollection copyFrom: 1 to: (qPosition + 1 min: e size).
					e := e asOrderedCollection reverse withIndexCollect: [ :v :i | v / (2 raisedToInteger: i) ] ] ].
	^ e sum