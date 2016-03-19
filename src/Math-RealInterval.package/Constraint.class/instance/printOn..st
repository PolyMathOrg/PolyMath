printing
printOn: aStream
|s|
   super printOn: aStream .
	aStream nextPut: $(.
	admissibleImage isRealInterval 
	ifTrue:[
	((admissibleImage inf ~= Float infinity negated)and: 
		[admissibleImage inf ~= admissibleImage sup ])ifTrue: 
			[ aStream print: admissibleImage inf; nextPutAll: ' <= ' ].
	s:=block asString.
	s:=(s copyReplaceAll: Character cr asString  with: ' ' asTokens:false) 
		"copyFrom: (s indexOf: $|)+2 to: (s size -2)".
	aStream nextPutAll: s.
	(admissibleImage sup=Float infinity )ifFalse: 
		[ (admissibleImage inf = admissibleImage sup) 
				ifTrue: [ aStream nextPutAll: ' = '] 
				ifFalse: [aStream nextPutAll: ' <= ']. 
			aStream print: admissibleImage sup ]]
	ifFalse:[ block printOn:aStream.
		aStream nextPutAll: ' : '.
		admissibleImage printOn:aStream.].
	aStream nextPut: $).
	