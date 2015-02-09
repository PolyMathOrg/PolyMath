*ArbitraryPrecisionFloat
adaptToArbitraryPrecisionFloat: rcvr andCompare: selector 
	"If I am involved in comparison with a Float, convert rcvr to a
	Fraction. This way, no bit is lost and comparison is exact."
	
	^ rcvr asTrueFraction perform: selector with: self