*Math-SqueakPrerequisite
stdev
	| avg sample sum |
	avg := self average. 
	"see comment in self sum"
	sample := self anyOne.
	sum := self inject: sample into: [:accum :each | accum + (each - avg) squared].
	sum := sum - sample.
	^ (sum / (self size - 1)) sqrt