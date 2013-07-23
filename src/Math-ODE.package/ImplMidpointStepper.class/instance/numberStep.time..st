as yet unclassified
numberStep: aState time: t
	| xi1 xi2 ti |
	ti := t + ((1/2)*self stepSize).
	xi1 := aState +( self stepSize * (system x: aState t: t)).
	xi2 := (1/2)*(aState + (system x: xi1 t: ti)).
	^ aState +  (self stepSize *  (system x: xi2 t: ti))	