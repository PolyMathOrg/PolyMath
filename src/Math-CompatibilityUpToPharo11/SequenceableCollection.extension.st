Extension { #name : #SequenceableCollection }

{ #category : #'*Math-CompatibilityUpToPharo11' }
SequenceableCollection >> closeTo: aSequenceableCollection precision: aPrecision [
	"Return true if all my elements are close to the elements of same index of the parameter with a certain precision"

	"(#(1.9283 2.3029) closeTo: #(1.9284 2.3028) precision: 0.001) >>> true"

	self with: aSequenceableCollection do: [ :a :b | (a closeTo: b precision: aPrecision) ifFalse: [ ^ false ] ].
	^ true
]
