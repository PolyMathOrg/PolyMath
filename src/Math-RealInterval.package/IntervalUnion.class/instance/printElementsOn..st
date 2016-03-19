printing
printElementsOn: aStream
	aStream nextPut: $(.
	self do: [:element | aStream print: element] separatedBy: [aStream nextPut: $u].
	aStream nextPut: $)