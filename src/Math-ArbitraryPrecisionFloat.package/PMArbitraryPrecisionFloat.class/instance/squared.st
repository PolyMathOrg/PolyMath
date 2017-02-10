arithmetic
squared
	| result |
	result := self copy.
	result inPlaceMultiplyBy: self.
	^result