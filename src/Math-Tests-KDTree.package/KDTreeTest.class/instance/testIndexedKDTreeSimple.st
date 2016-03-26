tests
testIndexedKDTreeSimple
	| r n aTree bTree |
	r := rand next: 200.
	aTree := IndexedKDTree
		withAll: (r collect: [ :i | FloatArray with: i with: i ]).	"2-dimensional data"
	bTree := IndexedKDTree
		withAll: (r collect: [ :i | FloatArray with: i ]).	"1-dimensional data"
	1 to: 20 do: [ :v | 
		n := 1 / v.
		self
			assert:
				(aTree
					nnSearch:
						{n.
						n}
					i: 1)
			equals: (bTree nnSearch: {n} i: 1) ]