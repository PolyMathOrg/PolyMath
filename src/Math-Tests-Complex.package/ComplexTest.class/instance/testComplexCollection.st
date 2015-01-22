tests
testComplexCollection
	"self run: #testComplexCollection"
	"self debug: #testComplexCollection"
	
	| array array2 |
	array := Array with: 1 + 2i with:  3 + 4i with: 5 + 6i.
	array2 := 2 * array.
	array with:  array2 do: [:one :two | self assert: (2 * one) = two ] 