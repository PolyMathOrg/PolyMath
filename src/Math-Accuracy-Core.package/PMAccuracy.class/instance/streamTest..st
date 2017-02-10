streaming
streamTest: aName
	| pno namesTree subTree oneResult|
	namesTree := (dataTree at: 'names') at: aName put: (subTree := KeyedTree new).
	pno := self numberOfDifferentParametersAt: aName.
	oneResult := (self numberOfDifferentResultsAt: aName) = 1.
	aStream << 'test '	<< aName;	cr.
	1 to: pno do: [ :parameterNo | 
		pno > 1 ifTrue: [ subTree:=self streamTest: aName withParameter: parameterNo tree: namesTree ].
		oneResult ifFalse: [ self tree: subTree type: 'expected result' data: (self resultsAt: aName) ].
		self streamResultsFor: aName tree: subTree single: oneResult ] 