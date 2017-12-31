examples
example1

"Compute Pi with nbits of precision"

| a b c k pi oldpi oldExpo expo nBits str |
nBits := 100.

a := PMArbitraryPrecisionFloat one asArbitraryPrecisionFloatNumBits: nBits + 16.
b := (a timesTwoPower: 1) sqrt reciprocal.
c := a timesTwoPower: -1.
k := 1.
oldpi := Float pi.
oldExpo := 2.
	
[| am gm a2 |
	am := a + b timesTwoPower: -1.
	gm := (a * b) sqrt.
	a := am.
	b := gm.
	a2 := a squared.
	c inPlaceSubtract: (a2 - b squared timesTwoPower: k).
	pi := (a2 timesTwoPower: 1) / c.
	expo := (oldpi - pi) exponent.
	expo isZero or: [expo > oldExpo or: [expo < (-1 - nBits)]]] 
			whileFalse: 
				[oldpi := pi.
				oldExpo := expo.
				k := k + 1].
pi asArbitraryPrecisionFloatNumBits: nBits.
str := (String new: 32) writeStream.
pi absPrintExactlyOn: str base: 10.
str contents