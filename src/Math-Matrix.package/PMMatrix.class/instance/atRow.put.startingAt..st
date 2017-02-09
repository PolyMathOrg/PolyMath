cell accessing
atRow: rowIndex put: aCollection startingAt: startColumnNumber 
	"Fill the receiver with aCollection at rowIndex beggining at startColumnNumber. "
		
	aCollection withIndexDo: [: value : columnIndex |
		(columnIndex + startColumnNumber ) <= self numberOfColumns 
		ifTrue:
		[ self 
			rowAt: rowIndex 
			columnAt: columnIndex + startColumnNumber
			put: value ]]
	
