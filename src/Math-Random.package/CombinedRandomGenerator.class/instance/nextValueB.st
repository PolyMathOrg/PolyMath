private
nextValueB
	"Evaluate next value of seedB using m, a, q and r of generatorB"

	| lo hi aLoRHi |
	hi := (seedB quo: 52774.0) asFloat.
	lo := seedB - (hi * 52774.0).  " = seed rem: q"  
	aLoRHi := (40692.0 * lo) - (3791.0 * hi).
	seedB := (aLoRHi > 0.0)
		ifTrue:  [aLoRHi]
		ifFalse: [aLoRHi +  2.147483399e9].
	^ seedB