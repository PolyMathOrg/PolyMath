converting
adaptToNumber: rcvr andSend: selector
	^ (self class value:rcvr)  perform: selector with: self