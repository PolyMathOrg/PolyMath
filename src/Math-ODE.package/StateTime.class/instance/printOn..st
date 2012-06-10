accessing
printOn: aStream
	"used for inspector. Using the point analogy"
	state printOn: aStream.
	aStream nextPut: $@.
	time printOn: aStream.
