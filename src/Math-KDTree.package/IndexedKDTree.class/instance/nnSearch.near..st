evaluating
nnSearch: aCollection near: aNNStore
|dist|
(self nearChild: aCollection)ifNotNilDo:[:c| c nnSearch: aCollection near: aNNStore ].
(aNNStore maxDistance)<( (dist := (value at: dim) - (aCollection at: dim) ) * dist ) ifTrue:[^self ].
dist := ((dist:= aCollection - value)*dist )sum.
(aNNStore maxDistance >dist ) ifTrue: [aNNStore add: {dist . {index . value}} ] .
(self farChild: aCollection)ifNotNilDo:[:c| c nnSearch: aCollection  near: aNNStore].