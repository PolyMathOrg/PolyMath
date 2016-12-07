double dispatching
adaptToNumber: rcvr andSend: selector
	^(self class coefficients: (Array with: rcvr) ) perform: selector with: self