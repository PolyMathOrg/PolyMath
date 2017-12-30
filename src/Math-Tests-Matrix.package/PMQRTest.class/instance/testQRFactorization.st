tests
testQRFactorization
	| a qr|
5 timesRepeat:[   
	a :=PMMatrix  rows: 5 columns: 4 random: 10.0. 
	qr :=a qrFactorization .
	self assert:( a equalsTo: (qr first * qr second )  ).
	self assert: ( (qr first squared ) equalsTo: (PMSymmetricMatrix identity: qr first numberOfColumns)    )  .
	2 to: (qr second numberOfRows) do: [:r| self  assert: (  ((qr second rowAt: r)first: (r-1)) equalsTo:  (Array new: (r-1) withAll:   0 ) ) ].
	
	qr :=a qrFactorizationWithPivoting .
	self assert:( a equalsTo: (qr first * (qr second inversePivotColumns:  (qr at:3)) )  ).
	self assert: ( (qr first squared ) equalsTo: (PMSymmetricMatrix identity: qr first numberOfColumns)    )  .
	2 to: (qr second numberOfRows) do: [:r| self  assert: (  ((qr second rowAt: r)first: (r-1)) equalsTo:  (Array new: (r-1) withAll:   0 ) ) ].
	
	a :=PMSymmetricMatrix new: 4 random: 10.0. 
	qr :=a qrFactorization .
	self assert:( a equalsTo: (qr first * qr second )  ).
	self assert: ( (qr first squared ) equalsTo: (PMSymmetricMatrix identity: qr first numberOfColumns)    )  .
	2 to: (qr second numberOfRows) do: [:r| self  assert: (  ((qr second rowAt: r)first: (r-1)) equalsTo:  (Array new: (r-1) withAll:   0 ) ) ].
	
	qr :=a qrFactorizationWithPivoting .
	self assert:( a equalsTo: (qr first * (qr second inversePivotColumns:  (qr at:3)) )  ).
	self assert: ( (qr first squared ) equalsTo: (PMSymmetricMatrix identity: qr first numberOfColumns)    )  .
	2 to: (qr second numberOfRows) do: [:r| self  assert: (  ((qr second rowAt: r)first: (r-1)) equalsTo:  (Array new: (r-1) withAll:   0 ) ) ].
	]