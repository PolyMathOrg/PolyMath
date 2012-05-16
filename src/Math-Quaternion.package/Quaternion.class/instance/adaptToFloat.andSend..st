converting
adaptToFloat: rcvr andSend: selector 
	"If I am involved in arithmetic with a Float, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self