*Math-Complex-Extensions
adaptToComplex: aComplex andSend: aByteSymbol 
	^ self collect: [:ea | aComplex perform: aByteSymbol  with: ea].