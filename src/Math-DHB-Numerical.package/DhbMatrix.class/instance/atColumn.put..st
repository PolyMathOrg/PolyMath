*Math-DHB-Numerical-Extensions
atColumn: aColumnIndex put: aCollection

	aCollection withIndexDo: [: value : rowIndex |
		self rowAt: rowIndex columnAt: aColumnIndex put: value ]
	
