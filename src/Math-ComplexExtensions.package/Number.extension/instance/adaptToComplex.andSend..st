*Math-ComplexExtensions
adaptToComplex: rcvr andSend: selector
	"If I am involved in arithmetic with a Complex number, convert me to a Complex number."
	^ rcvr perform: selector with: self asComplex