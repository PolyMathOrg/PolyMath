running
testFractionDoubleDispatch
	"needed for coverage of adaptToFraction:andSend:"
	| frac |

	frac := 1 / 2.
	self should: [(frac + q1234) = (q1234 + frac)].
	self should: [(frac + q1234) real isKindOf: Fraction].
	self should: [(frac + q1234) real = (3 / 2)]. 