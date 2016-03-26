tests
testBinomialGeneratorConvergesToMean
	"this test may fail one or more assertions, but its purpose is to verify correct convergence of the binomial distribution, should be Normal (np, np(1-p))"

	| gen nums mean |
	mean := Random new next sqrt.
	gen := BinomialGenerator n: 3000 p: mean.
	mean := mean * 3000.
	nums := OrderedCollection new.
	(1 to: 3000) do: [ :ea | nums add: gen next ].
	self assert: nums min > (mean * 0.8).
	self assert: nums max < (mean * 1.2).
	self assert: (nums average - mean) abs < 5