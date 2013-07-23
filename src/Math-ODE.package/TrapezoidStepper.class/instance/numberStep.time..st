as yet unclassified
numberStep: aState time: t
	| xi1 xi2 ti |
	ti := t + self stepSize.
	xi1 := aState + self stepSize * (system x: aState t: t).
	xi2 := aState + (1 / 2) * self stepSize * ((system x: aState t: t) + (system x: xi1 t: ti)).
	^ aState + (1 / 2) * self stepSize * ((system x: aState t: t) + (system x: xi2 t: ti))