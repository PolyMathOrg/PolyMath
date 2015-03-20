private
nextValueA
	"Evaluate next value of seedA using m and a of generatorA"

	| lo hi aLoRHi |
	hi := (seedA quo: 53668.0) asFloat.
	lo := seedA - (hi * 53668.0).  " = seed rem: q"  
	aLoRHi := ( 40014.0 * lo) - ( 12211.0 * hi).
	seedA := (aLoRHi > 0.0)
		ifTrue:  [aLoRHi]
		ifFalse: [aLoRHi + 2.147483563e9].
	^ seedA