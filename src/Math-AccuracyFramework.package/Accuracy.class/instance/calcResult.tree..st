running
calcResult: aName tree: aTree
	| aResult c|
	c := self performCheck: aName.
	self tree: aTree type: 'result' data: c .
	aResult := c average.
	self ifSeveralterations: [aStream <<'mean '] .
	(self format: aResult type: 'result' postfix:nil tree: aTree)space.
	self ifSeveralterations: [ self streamDeviationsOfResult: aResult inCollection: c tree: aTree].
	^ aResult 