cell accessing
atRow: rowIndex put: aCollection

	aCollection withIndexDo: [: value : columnIndex |
		self rowAt: rowIndex columnAt: columnIndex put: value ]
	
