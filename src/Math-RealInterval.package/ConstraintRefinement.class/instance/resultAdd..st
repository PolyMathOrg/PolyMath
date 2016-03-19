private
resultAdd: aBox
|b col|
col:=aBox asSimpleBoxes .
col do:[:abox|
	b :=BoxSplicing constraints: constraints  box: abox.
	b:= fast ifTrue: [ b doFastSplicing ] ifFalse: 
		[b doRepeatedSplicing ] .
	b ifNotEmpty: [ result add: b ]].