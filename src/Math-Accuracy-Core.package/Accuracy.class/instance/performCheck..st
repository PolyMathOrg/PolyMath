running
performCheck: aName
	^ (1 to: iterations)
		collect: [ :i | [ Processor yield. self setUp. self asArray: (self perform: ('check' , aName) asSymbol) ]
				ensure: [ self tearDown ]]