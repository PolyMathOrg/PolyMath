Extension { #name : #SequenceableCollection }

{ #category : #'*Math-Core' }
SequenceableCollection >> equalsTo: aSequenceableCollection [

"^ self = aSequenceableCollection "
self with: aSequenceableCollection do: [:a :b| (a equalsTo: b) ifFalse: [^false]   ].
^true
]
