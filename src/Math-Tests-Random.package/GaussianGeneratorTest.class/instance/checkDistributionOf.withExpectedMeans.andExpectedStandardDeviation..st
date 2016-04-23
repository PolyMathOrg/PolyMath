utils
checkDistributionOf: aGenerator withExpectedMeans: e andExpectedStandardDeviation: sd
	"fixme: this test ignores the standard deviation and occasionally fails"
	| data m |
	data := Set new.
	10000 timesRepeat: [ data add: aGenerator next ].
	m := data average.
	self assert: (e - m) abs <= 0.2.
	self assert: (data stdev - sd) abs <= 1