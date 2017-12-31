tests
testComplexCollection
	"self run: #testComplexCollection"

	"self debug: #testComplexCollection"

	| array array2 |
	array := Array with: 1 + 2 i with: 3 + 4 i with: 5 + 6 i.
	array2 := 2 * array.
	array
		with: array2
		do: [ :one :two | self assert: 2 * one equals: two ]