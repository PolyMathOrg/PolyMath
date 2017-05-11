private
largestPowerOf2SmallerThan: anInteger
	"Private - "
	| m m2|
	m := 2.
	[ m2 := m * 2.
	  m2 < anInteger] whileTrue:[ m := m2].
	^m