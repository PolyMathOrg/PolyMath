as yet unclassified
runAllToXML: numOfIterations
	| writer |
	writer := XMLWriter new.
	writer
		enablePrettyPrinting;
		xml.
	writer tag: 'smark' with: [ 
		(self runAll: numOfIterations) do: [ :runner |
			writer tag: 'suite' attributes: { #name -> runner suite class name asString } asDictionary with: [  
				runner results keysAndValuesDo: [ :key :value |
					writer tag: 'benchmark' with: [ 
						writer 
							tag: 'name' with: key;
							tag: 'time' with: ((value inject: 0 into: [ :subTotal :result |
								subTotal + result total ]) / value size) asFloat asString] ] ] ] ].

	^ writer 