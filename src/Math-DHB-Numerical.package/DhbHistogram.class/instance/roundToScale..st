information
roundToScale: aNumber
	"Private - Adjust aNumber of the lowest upper scale"
	| orderOfMagnitude norm scales rValue |
	orderOfMagnitude := ( aNumber log: 10) floor.
	scales := self class scales.
	aNumber isInteger
		ifTrue: [ orderOfMagnitude < 1
						ifTrue: [ orderOfMagnitude := 1].
					  orderOfMagnitude = 1
						ifTrue: [ scales := self class integerScales].
					  orderOfMagnitude = 2
						ifTrue: [ scales := self class semiIntegerScales].
				    ].
	norm := 10 raisedToInteger: orderOfMagnitude.
	rValue := aNumber / norm.
	^( scales detect: [ :each | rValue <= each]) * norm