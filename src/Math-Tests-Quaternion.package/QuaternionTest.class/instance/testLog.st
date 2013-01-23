running
testLog
	"this ensures that log and ln have the expected relationship"
	| qln qlg10ln |
	qln := q1234 ln.
	qlg10ln := q1234 log * 10 ln.
	
	"this inspires me to implement Quaternion>>equalsTo: "
	self should: [qln qr equalsTo: qlg10ln real].
	self should: [qln qi equalsTo: qlg10ln qi].
	self should: [qln qj equalsTo: qlg10ln qj].
	self should: [qln qk equalsTo: qlg10ln qk].