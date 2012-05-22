tests
testSinc
	"test cardinal sine"
	self assert: 0 sinc = 1.
	self assert: 0 sinc isInteger.
	self assert: 0.0 sinc isFloat.
	self assert: (Float pi sinc equalsTo: 0.0).