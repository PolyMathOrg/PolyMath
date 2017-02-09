*Math-DHB-wk
qrFactorization
	|identMat q r hh colSize i|
	self numberOfRows < self numberOfColumns ifTrue:[ self error: 'numberOfRows<numberOfColumns' ]. 
	r :=PMMatrix rows: (rows deepCopy).
	colSize := self numberOfRows.
	q := PMSymmetricMatrix identity: colSize.  
	identMat := q deepCopy.
	1 to: self numberOfColumns do: [:col| 
		hh := ((r columnAt: col) copyFrom: col to: colSize) householder.
		i := (PMVector new: col-1withAll: 0) , (hh at:2 ).
		q := q* (identMat - ((hh at: 1)*i tensorProduct: i ))."not really necessary, should be simplified"
		i := PMMatrix rows:  ( (r rows allButFirst: (col -1)) collect: [:aRow| aRow allButFirst: (col -1)]  ).
		i := i - ((hh at: 2) tensorProduct: ( (hh at: 1)*(hh at: 2)*i  ) ) .
		i rows withIndexDo: [ :aRow :index |
			aRow  withIndexDo: [ :n :c| r rowAt: (col + index -1) columnAt: (col +c -1) put: ((n equalsTo: 0) ifTrue: [0] ifFalse:  [n]  )  ]  ] .
	"col <colSize ifTrue: [i :=(hh at: 2) copyFrom: 2 to: colSize -col +1.  i withIndexDo: [:n :index| r rowAt: col columnAt: index put: n  ]  ]""and this part is not correct, dont uncomment before the bug is corrected! useful if q is not explicitely necessary" ].
"r rows allButFirst withIndexDo: [:aRow :ri|1 to: (ri min: self numberOfColumns ) do: [:ci|aRow at: ci put:0  ]   ]  ""not necessary with equalsTo:0"  
	i :=0.
	[(r rowAt: colSize) allSatisfy: [:n| n=0]  ]whileTrue: [i :=i+1.colSize :=colSize -1].
	i>0 ifTrue: [ r :=PMMatrix rows: (r rows copyFrom: 1 to:  colSize). 
					i := q numberOfColumns - i. 
					q := PMMatrix rows:  ( q rows collect: [:row| row copyFrom: 1 to: i]) ].  
	^{q. r}