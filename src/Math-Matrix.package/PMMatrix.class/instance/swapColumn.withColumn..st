as yet unclassified
swapColumn: anIndex withColumn:   a2Index
	self rowsDo: [ :r| r swap: anIndex with: a2Index ]  