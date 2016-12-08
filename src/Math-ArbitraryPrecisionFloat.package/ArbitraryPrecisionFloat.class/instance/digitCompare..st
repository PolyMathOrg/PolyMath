private
digitCompare: b 
	"both are positive or negative.
	answer +1 if i am of greater magnitude, -1 if i am of smaller magnitude, 0 if equal magnitude"
	
	| compare |
	self isZero
		ifTrue: [b isZero
				ifTrue: [^ 0]
				ifFalse: [^ -1]].
	b isZero
		ifTrue: [^ 1].
	compare := (self exponent - b exponent) sign.
	^ compare = 0
		ifTrue: [(self abs - b abs) sign]
		ifFalse: [compare]