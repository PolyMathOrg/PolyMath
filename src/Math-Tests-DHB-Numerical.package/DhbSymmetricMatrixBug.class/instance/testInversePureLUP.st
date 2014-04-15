tests
testInversePureLUP
|m i|
m:=DhbSymmetricMatrix rows: #((2 2 3)(2 4 5)(3 5 6)).
"this raises an error"
self shouldnt: [i:=m inversePureLUP]raise: Error.
self assert: (m*i=( DhbSymmetricMatrix identity: 3)).
"there is no(!) bug in inversePureCRL, but it is nowhere tested i think, hence i just added this here for the sake of simplicity (and because i simplified inversePureCRL)"
i:=m inversePureCRL .
self assert: (m*i=( DhbSymmetricMatrix identity: 3)).
