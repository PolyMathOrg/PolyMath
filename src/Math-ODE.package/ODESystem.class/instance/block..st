accessing
block: aBlock
	"aBlock should be dyadic, the first parameter is x, the second t"
	self assert: aBlock argumentCount = 2.
	^ block := aBlock