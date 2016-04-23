private
nextRandomValue
	"Calculate the next modulo inverse value for n+1"

	| rem newrem inv newinv transrem transinv quotient |
	inv := 0.
	newinv := 1.
	rem := p.
	newrem := nextN.
	[newrem ~= 0] whileTrue: [quotient := rem // newrem.
								transrem := newrem.
								newrem := rem \\ newrem.
								rem := transrem.
								transinv := newinv.
								newinv := inv - (quotient * newinv).
								inv := transinv].
	(inv < 0) ifTrue: [inv := inv + p].						
	nextValue := inv.
	nextN := nextN + 1.
	^nextValue
	