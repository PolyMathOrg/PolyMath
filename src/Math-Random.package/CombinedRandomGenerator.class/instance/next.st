accessing
next
	"Combine seedA and seedB to produce new seed. Seed is in the interval [0, 1]. "

	 seed := (self nextValueA) - (self nextValueB).
	 seed < 1 ifTrue: [seed := seed + 2.147483562e9].
	 seed := seed *  4.656613057391769e-10.
	^ seed
	
	