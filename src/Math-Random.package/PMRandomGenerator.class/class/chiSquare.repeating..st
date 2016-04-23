testing
chiSquare: range repeating: anInteger
	"Run a 'chi-square' test on a random number generator, over a range of integers given by range, repeating anInteger times.  
    Answer an Array containing the result of the chi-square test (which should be the same as the range), and the upper and lower bounds for 'good' randomness (assuming that anInteger is at least 10 * range)."

	"LCRandom chiSquare: 100 repeating: 4000"

	| array rand ave |
	array := Array new: range withAll: 0.
	rand := self new.
	anInteger
		timesRepeat:
			[ | temp |
			temp := (rand next * range) truncated + 1.
			array at: temp put: (array at: temp) + 1 ].
	ave := 0.
	array do: [ :each | ave := ave + (each * each) ].
	^ Array
		with: range - (2 * range sqrt)
		with:
			ave * range / anInteger - anInteger asFloat
		with: range + (2 * range sqrt)