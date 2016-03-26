tests
testSmallSample
	"sample from http://www.math.montana.edu/~jobo/st431/ho2b.pdf"

	| d1 d2 |
	d1 := #(20.30 22.53 25.70 13.23 29.67 24.46 26.07 19.35 17.813 16.00 15.30 32.90).
	d2 := #(10.56 28.13 19.94 11.03 8.093 12.95 21.14 32.50 10.90).
	k data: d1.
	k otherData: d2.
	self assert: (1 - k pValue asFloat roundTo: 0.00001) equals: 0.06063.
	self assert: k ksStatistic equals: 5 / 9.	"0.55555...6"
	self deny: (k rejectEqualityHypothesisWithAlpha: 0.05).
	self assert: (k rejectEqualityHypothesisWithAlpha: 0.07)