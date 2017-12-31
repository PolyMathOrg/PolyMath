*Math-ComplexExtensions
productWithVector: aVector
	"Answers a new vector product of the receiver with aVector."

	^ aVector collect: [ :each | each * self ]