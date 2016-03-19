operation
evaluateIteration
|aBox int|
epsilon := epsilon / 2.0.
aBox:=result collect: [:i|i copy].
int:=(aBox at: dimension).
left ifTrue: [ int sup: (epsilon+int inf) ] 
	ifFalse: [int inf: (int sup - epsilon)] .
^(constraints isNotAdmissibleValue: aBox) 
	ifTrue: [ result at: dimension put:((result at: dimension)  difference: int). 0 ] 
	ifFalse: [ 1 ]
