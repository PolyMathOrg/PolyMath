streaming
streamTest: aName withParameter: parameterNo tree: d
	| aParameter tree |
	self tree: d type: 'parameter' data: (aParameter := self parameterAt: aName).
	numberOfParameters := parameterNo.
	aParameter := aParameter at: parameterNo.
	d at: aParameter put: (tree := KeyedTree new).
	(self format: aParameter type: 'parameter' postfix: nil) cr.
	^ tree