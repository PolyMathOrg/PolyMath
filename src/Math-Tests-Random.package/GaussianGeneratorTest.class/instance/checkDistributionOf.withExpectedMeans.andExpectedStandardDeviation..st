as yet unclassified
checkDistributionOf: aGenerator withExpectedMeans: e andExpectedStandardDeviation: sd
	"fixme: this test ignores the standard deviation and occasionally fails"
	| data m |
	data := Set new.
	10000 timesRepeat: [ data add: aGenerator next ].
	m := data average.
	self assert: e - m <= 0.2