mathematical functions
agm: aNumber 
	"Answer the arithmetic geometric mean of self and aNumber"

	| a b am gm |
	a := self.
	b := aNumber.
	
	[am := a + b timesTwoPower: -1.	"am is arithmetic mean"
	gm := (a * b) sqrt.	"gm is geometric mean"
	a = am or: [b = gm]] 
			whileFalse: 
				[a := am.
				b := gm].
	^am