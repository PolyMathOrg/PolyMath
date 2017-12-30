accessing
computePValues
	| p n |
	n := x numberOfRows.
	p := PMMatrix zerosRows: n cols: n.
	1 to: n do: [ :each |
		 ].
	^ p