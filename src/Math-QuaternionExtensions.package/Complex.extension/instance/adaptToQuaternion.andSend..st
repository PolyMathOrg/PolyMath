*Math-QuaternionExtensions-converting
adaptToQuaternion: rcvr andSend: selector 
	"If I am involved in arithmetic with a Quaternion, convert me to a Quaternion."
	^ rcvr perform: selector with: self asQuaternion