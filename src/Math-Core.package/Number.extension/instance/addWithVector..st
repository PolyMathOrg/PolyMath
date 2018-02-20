*Math-Core
addWithVector: aVector
	"Adds itself to each element of the vector"
	^ aVector collect: [ :each | each + self ]