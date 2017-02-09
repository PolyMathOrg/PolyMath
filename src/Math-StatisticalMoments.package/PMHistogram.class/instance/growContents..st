private
growContents: anInteger
	"Private "
	anInteger > 0
		ifTrue: [ self growPositiveContents: anInteger ]
		ifFalse: [ self growNegativeContents: anInteger ]