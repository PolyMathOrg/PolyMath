as yet unclassified
numberStep: aState time: t
	| xi ti |
	ti := t + self stepSize.
	xi := aState + self stepSize * (system x: aState t: t).
	^ aState + (1 / 2) * self stepSize * ((system x: aState t: t) + (system x: xi t: ti))