tests
testVectorHouseholder
"result is householdermatrix * v"
(2 to: 5) do:[:i| |v h result| (1 to: 9) do:  [:unimportant|
	v:=PMVector new:i random:5.8.
	h :=v householder .
	result :=(((PMSymmetricMatrix identity: i) -  ((h at: 1)*(h at:2) tensorProduct: (h at:2))) *v).
	self deny:   (result first equalsTo: 0).
	result allButFirst 	do: [:aNumber|self assert:   (aNumber equalsTo: 0)  ] . ] ]