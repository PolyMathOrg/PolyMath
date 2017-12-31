tests
testHash
	| aComplex |
	aComplex := 2 - 3 i.
	self assert: aComplex copy hash equals: aComplex hash