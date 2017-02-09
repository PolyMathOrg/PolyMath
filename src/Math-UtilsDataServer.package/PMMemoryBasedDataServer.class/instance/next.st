operation
next
	"Answers the next element on the stream."
	| answer |
	answer := data at: position.
	position := position + 1.
	^answer