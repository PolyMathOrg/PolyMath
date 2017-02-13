private
nnSearch: aSequenceableCollection near: aNNStore
	| dist |
	(self nearChild: aSequenceableCollection)
		ifNotNil: [ :c | c nnSearch: aSequenceableCollection near: aNNStore ].
	aNNStore maxDistance
		< ((dist := (value at: dim) - (aSequenceableCollection at: dim)) * dist)
		ifTrue: [ ^ self ].
	dist := ((dist := aSequenceableCollection - value) * dist) sum.
	self add: dist to: aNNStore.
	(self farChild: aSequenceableCollection)
		ifNotNil: [ :c | c nnSearch: aSequenceableCollection near: aNNStore ]