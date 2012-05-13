*Math-Complex-Extensions
adaptToComplex: rcvr andSend: selector
	^(self class coefficients: (Array with: rcvr) ) perform: selector with: self