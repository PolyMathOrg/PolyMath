as yet unclassified
asArray
	
	| array i|
	array := Array new: self size.
	i := 0.
	self do: [:item | array basicAt: (i:=i+1) put: item].
	^ array