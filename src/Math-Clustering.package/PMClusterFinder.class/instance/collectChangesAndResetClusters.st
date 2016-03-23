private
collectChangesAndResetClusters

	| hasEmptyClusters changes |
	changes := 0.
	hasEmptyClusters := false.
	result do: 
			[ :each | 
			changes := each changes + changes.
			(each isInsignificantIn: self)
				ifTrue: 
					[ each centerOn: nil.
					hasEmptyClusters := true ]
				ifFalse: [ each reset ].
			].
	hasEmptyClusters 
		ifTrue: [ result := result reject: [ :each | each isUndefined ]].
	^ changes / 2