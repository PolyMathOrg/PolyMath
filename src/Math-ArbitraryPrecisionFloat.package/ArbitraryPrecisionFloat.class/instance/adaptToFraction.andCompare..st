converting
adaptToFraction: rcvr andCompare: selector 
	"If I am involved in comparison with a Fraction, convert myself to a
	Fraction. This way, no bit is lost and comparison is exact."

	^ rcvr perform: selector with: self asTrueFraction