streaming
putExpectedResult: anExpectedResult totree: aTree
	| e |
	e := anExpectedResult.
	[ (aTree at: e ifPresent: [ Array new: (e size + 1)])
		ifNil: [ ^aTree at: e put:  KeyedTree new ] 
		ifNotNilDo: [:a|
			a replaceFrom: 1 to: e size with: e startingAt: 1; 
			  at: a size put: $+.
			e:=a.
			false ] ] whileFalse.