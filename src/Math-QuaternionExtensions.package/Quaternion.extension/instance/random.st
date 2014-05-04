*Math-QuaternionExtensions
random
	"analog to Number>>random. The resulting quaternion will have abs at most that of the receiver"
	^ self class random * self.