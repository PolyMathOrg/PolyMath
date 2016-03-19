operation
cleanUp
|domain range isNoBox|
domain :=(isNoBox :=(severalBoxes ifTrue: [ box first ] ifFalse: [box]) isRealInterval) 
	ifTrue: [IntervalUnion new]
	ifFalse:[OrderedCollection new].
range :=IntervalUnion new.
result do: [ :i|domain add:i first.range add: i last ].
domain ifNotEmpty: [isNoBox 
	ifTrue:[ domain strongReduce] 
	ifFalse: [self useSloppySimplification ifTrue: [domain := domain reduce: [:aBox :bBox| aBox quasiUnion: bBox ]] ]].
range strongReduce.
^result:=Array with: domain with: range  