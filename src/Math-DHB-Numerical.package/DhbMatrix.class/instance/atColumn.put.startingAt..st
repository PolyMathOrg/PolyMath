*Math-DHB-Numerical-Extensions
atColumn: aColumnNumber put: aCollection startingAt: rowNumber
	" Fill the receiver with aCollection at aColumnNumber beggining
	at rowNumber. "
	
	aCollection withIndexDo: [: value : rowIndex |
		self rowAt: rowIndex + rowNumber
			columnAt: aColumnNumber 
			put: value ]
	
