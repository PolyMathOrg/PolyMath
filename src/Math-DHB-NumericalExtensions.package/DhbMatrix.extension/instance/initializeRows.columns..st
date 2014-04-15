*Math-DHB-NumericalExtensions
initializeRows: rowsInteger columns: columnsInteger
	"Build empty components for a matrix."
		
	rows := ( 1 to: rowsInteger ) asDhbVector collect: [ :each | DhbVector new: columnsInteger ].