converting
adaptToInteger: rcvr andSend: selector 
	"If I am involved in arithmetic with an Integer, convert it to a Quaternion."
	^ rcvr asQuaternion perform: selector with: self