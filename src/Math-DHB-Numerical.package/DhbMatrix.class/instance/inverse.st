operation
inverse
	"Answer the inverse of the receiver."

	^ self isSquare 
		ifTrue: [ self lupInverse ]
		ifFalse: [ self squared inverse * self transpose ]