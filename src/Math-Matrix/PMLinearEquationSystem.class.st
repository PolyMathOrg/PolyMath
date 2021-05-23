"
This class offers Gaussian elimination.

[[[ 
 (PMLinearEquationSystem equations: #( (3 2 4)
                                   (2 -5 -1)
                                   (1 -2 2))
                      constant: #(16 6 10)
     ) solution.
]]]

Note that Gaussian elimination is solely dedicated to solving systems of linear equations. The algorithm is somewhat slower than LUP decomposition.

If the system does not have a solution --- that is, if the system's matrix is singular --- an arithmetic error occurs in the
method ==pivotAt:== when the division with the zero pivot is performed. The method ==solutionAt:== traps this error within an
exception handling structure and sets the solution vector to a special value --- the integer 0 --- as a flag to prevent attempting Gaussian elimination a second time. Then, the value ==nil== is returned to represent the non-existent solution.
"
Class {
	#name : #PMLinearEquationSystem,
	#superclass : #Object,
	#instVars : [
		'rows',
		'solutions'
	],
	#category : #'Math-Matrix'
}

{ #category : #creation }
PMLinearEquationSystem class >> equations: anArrayOfArrays constant: anArray [ 

	^ self basicNew 
			initialize: anArrayOfArrays 
			constants: (Array with: anArray)
]

{ #category : #creation }
PMLinearEquationSystem class >> equations: anArrayOfArrays constants: anArrayOfConstantArrays [ 

	^ self basicNew 
		initialize: anArrayOfArrays 
		constants: anArrayOfConstantArrays
]

{ #category : #transformation }
PMLinearEquationSystem >> backSubstitutionAt: anInteger [
		"Private - Perform the back-substitution step corresponding to the anInteger-th constant array."
	| size answer accumulator |
	size := rows size.
	answer := Array new: size.
	size to: 1 by: -1 do:
		[ :n |
		  accumulator := (rows at: n) at: (anInteger + size).
		  (n + 1) to: size
			do: [ :m | accumulator := accumulator - ((answer at: m) * ((rows at: n) at: m))].
		  answer at: n put: (accumulator / ( ( rows at: n) at: n)).
		].
	solutions at: anInteger put: answer.
]

{ #category : #initialization }
PMLinearEquationSystem >> initialize: anArrayOfArrays constants: anArrayOfConstantArrays [
	"Private - Initialize the receiver with system's matrix in anArrayOfArrays and several constants."
	| n |
	n := 0.
	rows := anArrayOfArrays collect: [ :each | n := n + 1. each, (anArrayOfConstantArrays collect: [ :c | c at: n])].
	^ self
]

{ #category : #information }
PMLinearEquationSystem >> largestPivotFrom: anInteger [
	"Private - Answers the largest pivot element in column anInteger, from position anInteger upward."
	| valueOfMaximum indexOfMaximum |
	valueOfMaximum := (rows at: anInteger) at: anInteger.
	indexOfMaximum := anInteger.
	(anInteger + 2) to: rows size do:
		[ :n |
		  ((rows at: n) at: anInteger) > valueOfMaximum
				ifTrue: [ valueOfMaximum := (rows at: n) at: anInteger.
							 indexOfMaximum := n.
						   ].
		].
	^ indexOfMaximum
]

{ #category : #transformation }
PMLinearEquationSystem >> pivotAt: anInteger [
	"Private - Performs pivot operation with pivot element at anInteger."
	| inversePivot rowPivotValue row pivotRow |
	pivotRow := rows at: anInteger.
	inversePivot := 1 / (pivotRow at: anInteger).
	(anInteger + 1) to: rows size do:
		[ :n |
		  row := rows at: n.
		  rowPivotValue := (row at: anInteger) * inversePivot.
		  anInteger to: row size do:
			[ :m |
			  row at: m put: ((row at: m) - ((pivotRow at: m) * rowPivotValue)).
			].
		].
]

{ #category : #transformation }
PMLinearEquationSystem >> pivotStepAt: anInteger [
	"Private - Performs an optimum pivot operation at anInteger."
	self swapRow: anInteger withRow: (self largestPivotFrom: anInteger);
		   pivotAt: anInteger.
]

{ #category : #printing }
PMLinearEquationSystem >> printOn: aStream [
	"Append to the argument aStream, a sequence of characters that describes the receiver."
	| delimitingString n k |
	n := rows size.
	rows 
		do:
			[ :row |
			  delimitingString := '('.
			  k := 0.
			  row do:
				[ :each |
					aStream nextPutAll: delimitingString.
					each printOn: aStream.
					k := k + 1.
					delimitingString := k < n ifTrue: [ ' '] ifFalse: [ ' : '].
				].
		 	aStream nextPut: $).]
		separatedBy: [ aStream cr]
	
]

{ #category : #information }
PMLinearEquationSystem >> solution [
	"Answers the solution corresponding to the first constant array."
	^ self solutionAt: 1
]

{ #category : #information }
PMLinearEquationSystem >> solutionAt: anInteger [
	"Answer the solution corresponding to the anInteger-th constant array."

	solutions isNil
		ifTrue: [ [self solve] on: Error do: [ :signal |solutions := 0. signal return: nil.] ].
	solutions = 0
		ifTrue: [ ^nil].
	(solutions at: anInteger) isNil
		ifTrue: [ self backSubstitutionAt: anInteger].
	^ solutions at: anInteger
]

{ #category : #transformation }
PMLinearEquationSystem >> solve [
	"Private - Perform LU decomposition of the system."
	1 to: rows size do: [ :n | self pivotStepAt: n ].
	solutions := Array new: ((rows at: 1) size - rows size).
]

{ #category : #transformation }
PMLinearEquationSystem >> swapRow: anInteger1 withRow: anInteger2 [
	"Private - Swap the rows indexed by the given integers."

	| swappedRow |
	anInteger1 = anInteger2
		ifTrue: [ ^ self ].
	swappedRow := rows at: anInteger1.
	rows at: anInteger1 put: (rows at: anInteger2).
	rows at: anInteger2 put: swappedRow
]
