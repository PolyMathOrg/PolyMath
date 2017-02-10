initialize-release
initNames
	names := (self class allSelectorsBelow: Object)
		select: [ :s | s beginsWith: #check ]
		thenCollect: [ :s | s copyFrom: 6 to: s size ].
	names := names asArray sort