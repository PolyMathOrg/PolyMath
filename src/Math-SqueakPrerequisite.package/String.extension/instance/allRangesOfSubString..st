*Math-SqueakPrerequisite
allRangesOfSubString: aSubString

	^ Array streamContents: [:s | | start subSize |
		start := 1.
		subSize := aSubString size.
		[start isZero]
			whileFalse: [ start := self findString: aSubString startingAt: start.
				start > 0 
					ifTrue: [s nextPut: (start to: start + subSize - 1).
						start := start + subSize]]]