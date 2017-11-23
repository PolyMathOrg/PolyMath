accessing
ksStatistic
	"the kolmogorov-smirnov statistic D"

	| c1 c2 cdfs s |
	self testDataComplete.
	self initKSStatistic.
	c1 := 0.
	c2 := 0.
	s := smallSize + bigSize.
	cdfs := (SortedCollection new: s)
		addAll: data;
		addAll: compareWith;
		yourself.
	cdfs
		withIndexDo: [ :a :i | 
			(i < s and: [ (cdfs at: i + 1) key = a key ])
				ifTrue: [ a value second
						ifTrue: [ c2 := (cdfs at: i + 1) value first ]
						ifFalse: [ c1 := (cdfs at: i + 1) value first ] ].
			ksStatistic := ksStatistic
				max:
					(a value second
						ifTrue: [ c1 := a value first.
							c1 - c2 ]
						ifFalse: [ c2 := a value first.
							c2 - c1 ]) ].
	^ ksStatistic