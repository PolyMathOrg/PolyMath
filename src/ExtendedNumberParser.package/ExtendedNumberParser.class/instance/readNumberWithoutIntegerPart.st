parsing-private
readNumberWithoutIntegerPart
	"at this stage, sign followed by a decimal point have been read, but no intergerPart
	try and form a number with a fractionPart"
	
	^self readNumberWithoutIntegerPartOrNil ifNil: [
		"No integer part, no fractionPart, this does not look like a number..."
		^self expected: 'a digit between 0 and 9'].