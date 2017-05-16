tests
testPrintOn
	| m stream |
	stream := String new writeStream.
	m := PMMatrix new.
	"this raised an error:"
	self shouldnt: [m printOn: stream] raise: Error 