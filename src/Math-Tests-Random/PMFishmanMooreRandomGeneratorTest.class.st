Class {
	#name : #PMFishmanMooreRandomGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMFishmanMooreRandomGeneratorTest >> testNext [
	| random expectedNumbers |
	random := PMFishmanMooreRandomGenerator new.
	random seed: 2147483646.
	expectedNumbers := #(0.6540424017 0.2032902977 0.1634123433 0.0948051145 0.1617738056 0.6769099178 0.4410270808 0.0819611824 0.3259203002 0.9101976547).
	(1 to: expectedNumbers size)
		with: expectedNumbers
		do: [ :i :expected | self assert: random next closeTo: expected ]
]
