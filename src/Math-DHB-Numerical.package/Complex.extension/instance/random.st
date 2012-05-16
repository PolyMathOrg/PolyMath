*Math-DHB-Numerical-Extensions
random
	"analog to Number>>random. However, the only bound is that the abs of the produced complex is less than the length of the receive. The receiver effectively defines a disc within which the random element can be produced."
	^ self class random * self
	