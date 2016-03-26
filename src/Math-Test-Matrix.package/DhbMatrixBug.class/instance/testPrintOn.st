tests
testPrintOn
	| m stream |
	stream := String new writeStream.
	m := DhbMatrix new.
	"this raised an error:"
	self shouldnt: [m printOn: stream] raise: Error 