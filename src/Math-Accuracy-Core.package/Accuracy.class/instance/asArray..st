private
asArray: aCol 
	^(aCol isCollection and: [ aCol isSequenceable and: [aCol isString not] ])  
		ifTrue: [ aCol asArray ] 
		ifFalse: [ {aCol} ]