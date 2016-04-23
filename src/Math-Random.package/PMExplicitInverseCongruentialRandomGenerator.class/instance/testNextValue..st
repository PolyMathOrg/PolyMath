tests
testNextValue: anInteger
	"This is to test the principle of modulo inverse"

	| rem newrem inv newinv transrem transinv quotient |
	inv := 0.
	newinv := 1.
	rem := 240.
	newrem := anInteger.
	[newrem ~= 0] whileTrue: [quotient := rem // newrem.
								transrem := newrem.
								newrem := rem \\ newrem.
								rem := transrem.
								transinv := newinv.
								newinv := inv - (quotient * newinv).
								inv := transinv].
	^ inv
	