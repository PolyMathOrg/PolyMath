*Math-DHB-Numerical-Extensions
initializeRows: rowsInteger columns: columnsInteger
	"Build empty components for a matrix."
		
	rows := ( 1 to: rowsInteger ) asVector collect: [ :each | DhbVector new: columnsInteger ].