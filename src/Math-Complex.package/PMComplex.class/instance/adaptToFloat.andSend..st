converting
adaptToFloat: rcvr andSend: selector
	"If I am involved in arithmetic with a Float, convert it to a Complex number."
	^ rcvr asComplex perform: selector with: self