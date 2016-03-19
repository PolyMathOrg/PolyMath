operation
evaluateIteration
	| aSplit |
	aSplit := initialQueue removeFirst.	"iterations =10 ifTrue:[self halt]."	"3."
	aSplit second inf > min	ifTrue: [ ^ self returnPrecision ]."4."
	aSplit := aSplit first split collect: [ :i ||f|
		f :=function value: i.
		f isEmpty ifFalse: [ 
		min := ( min min:(function value: i midPoint) asFloat successor) min: f sup].
		Array with: i with: f ]."5"
	aSplit do: [: domCo||co| "+further tests"
		((co:=domCo second) width < myDesiredPrec)"6"	
			ifTrue: [ co inf <= min ifTrue: [self resultAdd: domCo ]]"7"
			ifFalse: [ initialQueue add: domCo ]]."9"
	^ self returnPrecision