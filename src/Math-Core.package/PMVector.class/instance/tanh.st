operation
tanh
	"Apply tanh function to every element of a vector"

	^ self collect: [ :each | each tanh ]