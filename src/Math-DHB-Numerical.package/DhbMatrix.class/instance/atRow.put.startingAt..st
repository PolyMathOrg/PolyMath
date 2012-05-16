*Math-DHB-Numerical-Extensions
atRow: rowIndex put: aCollection startingAt: startColumnNumber 
	" Fill the receiver with aCollection at rowIndex beggining at startColumnNumber. "
		
	aCollection withIndexDo: [: value : columnIndex |
		self 
			rowAt: rowIndex 
			columnAt: columnIndex + startColumnNumber
			put: value ]
	
