display
printOn: aStream
	super printOn: aStream.
	bestPoints do: [ :each | aStream cr. each printOn: aStream]