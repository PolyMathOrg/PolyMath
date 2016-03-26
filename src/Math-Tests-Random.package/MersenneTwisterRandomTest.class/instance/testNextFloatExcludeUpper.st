tests
testNextFloatExcludeUpper
	"this revealed a bug in early versions, excludeUpper was producing between 0 and 2"

	| g sample1 sample2 |
	g := MersenneTwisterRandom new.
	sample1 := Array new: 10000.
	sample2 := Array new: 10000.
	1 to: 10000 do: [ :i | 
		sample1 at: i put: g nextFloatExcludeUpper.
		sample2 at: i put: (g nextFloatExcludeUpper: 2) ].
	self assert: sample1 max < 1.
	self shouldnt: [ sample1 max < 0.8 ].
	self assert: sample2 max < 2.
	self shouldnt: [ sample2 max < 1.6 ]