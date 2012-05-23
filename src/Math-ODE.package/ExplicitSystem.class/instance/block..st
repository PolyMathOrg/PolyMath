accessing
block: aBlock
	"aBlock should be dyadic, the first parameter is X, the second t"
	self assert: aBlock argumentCount = 2.
	^ block := aBlock.