tests
testPeekAnswersSame
	"every subclass should implement some basic behavior."

	PMNumberGenerator subclasses
		do: [ :ea | 
			| random numberGenerator |
			numberGenerator := ea new.
			10
				timesRepeat: [ random := numberGenerator peek.
					self assert: random equals: numberGenerator peek.
					self assert: random equals: numberGenerator next ] ]