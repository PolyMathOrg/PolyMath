tests
testInversePureLUP
	| m i |
	m := PMSymmetricMatrix rows: #(#(2 2 3) #(2 4 5) #(3 5 6)).
	"this raises an error"
	i := m inversePureLUP.
	self assert: m * i equals: (PMSymmetricMatrix identity: 3).
	"there is no(!) bug in inversePureCRL, but it is nowhere tested i think, hence i just added this here for the sake of simplicity (and because i simplified inversePureCRL)"
	i := m inversePureCRL.
	self assert: m * i equals: (PMSymmetricMatrix identity: 3)