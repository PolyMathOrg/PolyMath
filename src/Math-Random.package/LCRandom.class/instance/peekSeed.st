accessing
peekSeed
	"Answer the next Integer seed calculated using a quick and dirty Linear congruential generator."

	^ (seed * 2311 + 25367) \\ 120050