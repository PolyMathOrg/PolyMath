accessing
columnAt: anInteger
	"Answers the anInteger-th column of the receiver."
	^ rows collect: [ :each | each at: anInteger ]