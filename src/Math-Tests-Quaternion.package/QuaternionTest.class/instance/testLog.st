running
testLog
	"this ensures that log and ln have the expected relationship"

	| qln qlg10ln |
	qln := q1234 ln.
	qlg10ln := q1234 log * 10 ln.

	"this inspires me to implement Quaternion>>equalsTo: "
	self assert: (qln qr equalsTo: qlg10ln real).
	self assert: (qln qi equalsTo: qlg10ln qi).
	self assert: (qln qj equalsTo: qlg10ln qj).
	self assert: (qln qk equalsTo: qlg10ln qk)