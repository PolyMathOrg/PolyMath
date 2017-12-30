collection
testCollect
	self assert: ((PMMatrix rows: #((1 2) (3 4))) collect: [ :x | 2 * x ]) equals: (PMMatrix rows: #((2 4) ( 6 8)))