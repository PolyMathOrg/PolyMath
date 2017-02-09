*Math-DHB-wk
qrFactorizationWithPivoting
	| identMat q r hh colSize i lengthArray rank mx pivot |
	self numberOfRows < self numberOfColumns
		ifTrue: [ self error: 'numberOfRows<numberOfColumns' ].
	lengthArray := self columnsCollect: [ :col | col * col ].
	mx := lengthArray indexOf: lengthArray max.
	pivot := Array new: lengthArray size.
	rank := 0.
	r := PMMatrix rows: rows deepCopy.
	colSize := self numberOfRows.
	q := PMSymmetricMatrix identity: colSize.
	identMat := q deepCopy.
	[ 
	rank := rank + 1.
	pivot at: rank put: mx.
	r swapColumn: rank withColumn: mx.
	lengthArray swap: rank with: mx.
	hh := ((r columnAt: rank) copyFrom: rank to: colSize) householder.
	i := (PMVector new: rank - 1 withAll: 0) , (hh at: 2).
	q := q * (identMat - ((hh at: 1) * i tensorProduct: i)).
	i := PMMatrix rows: ((r rows allButFirst: rank - 1) collect: [ :aRow | aRow allButFirst: rank - 1 ]).
	i := i - ((hh at: 2) tensorProduct: (hh at: 1) * (hh at: 2) * i).
	i rows
		withIndexDo: [ :aRow :index | 
			aRow
				withIndexDo: [ :n :c | 
					r
						rowAt: rank + index - 1
						columnAt: rank + c - 1
						put:
							((n equalsTo: 0)
								ifTrue: [ 0 ]
								ifFalse: [ n ]) ] ].
	rank + 1 to: lengthArray size do: [ :ind | lengthArray at: ind put: (lengthArray at: ind) - (r rowAt: rank columnAt: ind) squared ].
	rank < lengthArray size
		ifTrue: [ 
			mx := (lengthArray copyFrom: rank + 1 to: lengthArray size) max.
			(mx equalsTo: 0)
				ifTrue: [ mx := 0 ].
			mx := mx > 0
				ifTrue: [ lengthArray indexOf: mx startingAt: rank + 1 ]
				ifFalse: [ 0 ] ]
		ifFalse: [ mx := 0 ].
	mx > 0 ] whileTrue.
	i := 0.
	[ (r rowAt: colSize) allSatisfy: [ :n | n = 0 ] ]
		whileTrue: [ 
			i := i + 1.
			colSize := colSize - 1 ].
	i > 0
		ifTrue: [ 
			r := PMMatrix rows: (r rows copyFrom: 1 to: colSize).
			i := q numberOfColumns - i.
			pivot := pivot copyFrom: 1 to: i.
			q := PMMatrix rows: (q rows collect: [ :row | row copyFrom: 1 to: i ]) ].
	^ {q.
	r.
	pivot}