instance creation
function: aBlock valueAtZero: valueAtZero derivativeAtZero: derivativeAtZero valueAtOne: valueAtOne
	^ self new
		setFunction: aBlock; setValueAtZero: valueAtZero derivativeAtZero: derivativeAtZero valueAtOne: valueAtOne; 
		yourself