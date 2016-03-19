accessing
box: aSequentialCollection
^aSequentialCollection isSequenceable 
	ifTrue: [ result := aSequentialCollection copy ] 
	ifFalse: [ self error ]
