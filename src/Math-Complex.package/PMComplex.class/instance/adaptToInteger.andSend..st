converting
adaptToInteger: rcvr andSend: selector
	"If I am involved in arithmetic with an Integer, convert it to a Complex number."
	^ rcvr asComplex perform: selector with: self