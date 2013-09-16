as yet unclassified
runToXML
	| writer |
	writer := XMLWriter new.
	writer
		enablePrettyPrinting;
		xml.
	writer tag: 'accuracy' with: [ 
		self run keysAndValuesDo:  [ :key :value |
			writer tag: key with: value asString]].

	^ writer 