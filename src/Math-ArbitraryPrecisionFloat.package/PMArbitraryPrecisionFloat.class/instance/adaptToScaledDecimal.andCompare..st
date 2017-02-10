converting
adaptToScaledDecimal: rcvr andCompare: selector 
	"If I am involved in comparison with a ScaledDecimal, convert myself to a
	Fraction. This way, no bit is lost and comparison is exact."

	^ rcvr asFraction perform: selector with: self asFraction