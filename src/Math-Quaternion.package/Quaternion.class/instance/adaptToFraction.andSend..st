converting
adaptToFraction: rcvr andSend: selector 
	"If I am involved in arithmetic with a Fraction, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self