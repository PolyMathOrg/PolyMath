initialization
initialize
	"Initialize No using Random and define the modulo (p)"

	| random |
	super initialize.
	p := 16r7FFFFFFF asFloat.
	random := Random new.
	nextN := random nextValue.
	