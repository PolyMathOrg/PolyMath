running
testExp
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 exp - (q1234 real exp * q1234 unreal exp)) abs < eps.
	self assert: ((1 + 2 i) exp - (1 + 2 j k) exp) abs < eps