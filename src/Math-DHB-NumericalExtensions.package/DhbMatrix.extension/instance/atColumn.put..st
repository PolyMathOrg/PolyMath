*Math-DHB-NumericalExtensions
atColumn: aColumnIndex put: aCollection

	aCollection withIndexDo: [: value : rowIndex |
		self rowAt: rowIndex columnAt: aColumnIndex put: value ]
	
