iterators
columnsDo: aBlock
	"Perform the collect: operation on the rows of the receiver."
	| n |
	n := 0.
	^ rows last do: [ :each | n := n + 1. aBlock value: ( self columnAt: n)]