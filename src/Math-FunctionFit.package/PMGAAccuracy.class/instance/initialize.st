initialize-release
initialize
	super initialize.
	fast :=false.
	self iterations: 10.
	self parameter: #(#(0.4 0.15 0.29 0.16) #(0.40 0.15 0.28 0.17))