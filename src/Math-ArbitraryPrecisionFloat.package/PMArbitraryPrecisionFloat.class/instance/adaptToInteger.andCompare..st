converting
adaptToInteger: rcvr andCompare: selector 
	"If I am involved in comparison with an Integer, convert myself to a
	Fraction. This way, no bit is lost and comparison is exact."

	^ rcvr perform: selector with: self asTrueFraction