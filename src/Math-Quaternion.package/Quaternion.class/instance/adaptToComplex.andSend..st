converting
adaptToComplex: rcvr andSend: selector 
	"If I am involved in arithmetic with a Complex, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self