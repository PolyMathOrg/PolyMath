Extension { #name : #SequenceableCollection }

{ #category : #'*Math-Helpers' }
SequenceableCollection >> closeTo: aSequenceableCollection [

	self
		with: aSequenceableCollection
		do: [ :a :b | (a closeTo: b) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #'*Math-Helpers' }
SequenceableCollection >> equalsTo: aSequenceableCollection [
	
	self
		deprecated: 'Use closeTo: instead'
		transformWith: '`@rec equalsTo: `@arg' -> '`@rec closeTo: `@arg'.

	^ self closeTo: aSequenceableCollection
]
