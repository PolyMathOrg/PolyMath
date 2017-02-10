converting
adaptToFraction: rcvr andSend: selector
	"If I am involved in arithmetic with a Fraction, convert it to a Complex number."
	^ rcvr asComplex perform: selector with: self