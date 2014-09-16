tests
testIntegerDigits
self assert: ((AnotherChromosomeManager integerDigitsFor: 0 base: 2)= #(0)).
self assert: ((AnotherChromosomeManager integerDigitsFor: 1 base: 3)= #(1)).
self assert: ((AnotherChromosomeManager integerDigitsFor: 12 base: 2)= #(1 1 0 0)).
self assert: ((AnotherChromosomeManager integerDigitsFor: 12 base: 4)= #(3 0)).
self assert: ((AnotherChromosomeManager integerDigitsFor: 49 base: 5)= #(1 4 4)).
