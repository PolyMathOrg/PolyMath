*Math-Complex
adaptToComplex: rcvr andSend: selector
	^ self collect: [ :ea | rcvr perform: selector with: ea ]