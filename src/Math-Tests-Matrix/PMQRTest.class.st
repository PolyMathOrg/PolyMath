Class {
	#name : #PMQRTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Matrix'
}

{ #category : #running }
PMQRTest >> assert: inverse isMoorePenroseInverseOf: aMatrix [

	"https://en.wikipedia.org/wiki/Moore–Penrose_inverse#Definition"

	| identityMatrix |
	"These two assertions are what define a pseudoinverse. They are known as
	the Moore–Penrose conditions of which there are four, but here we have two. The other two
	are that (A * A+) and A+ * A are Hermitian.
	"
	self assert: aMatrix * inverse * aMatrix closeTo: aMatrix.
	self assert: inverse * aMatrix * inverse closeTo: inverse.
	
	identityMatrix := aMatrix * inverse.
	self assert: identityMatrix transpose closeTo: identityMatrix.
	self assert: identityMatrix * aMatrix closeTo: aMatrix.

	"Pseudoinversion commutes with transposition, complex conjugation, and taking the conjugate transpose"
	self
		assert: aMatrix transpose mpInverse
		closeTo: aMatrix mpInverse transpose.
]

{ #category : #tests }
PMQRTest >> testDecompositionOfMatrixCausingErraticFailure [

	| a qrDecomposition matricesAndPivot q r expectedMatrix pivot |
	a := PMSymmetricMatrix rows:
		     #( #( 0.41929313699681925 0.05975350554089691
		           0.2771676258543356 0.35628773381760703 )
		        #( 0.05975350554089691 0.12794227252152854
		           0.3257742693302102 0.28814463284245906 )
		        #( 0.2771676258543356 0.3257742693302102 0.8468441832097453
		           0.9101872061892353 )
		        #( 0.35628773381760703 0.28814463284245906
		           0.9101872061892353 0.5163744224777326 ) ).

	qrDecomposition := PMQRDecomposition of: a.
	matricesAndPivot := qrDecomposition decomposeWithPivot.

	expectedMatrix := PMMatrix rows:
		                  #( #( 0.2771676258543356 0.35628773381760703
		                        0.41929313699681925 0.05975350554089691 )
		                     #( 0.3257742693302102 0.28814463284245906
		                        0.05975350554089691 0.12794227252152854 )
		                     #( 0.8468441832097453 0.9101872061892353
		                        0.2771676258543356 0.3257742693302102 )
		                     #( 0.9101872061892353 0.5163744224777326
		                        0.35628773381760703 0.28814463284245906 ) ).
	q := matricesAndPivot at: 1.
	r := matricesAndPivot at: 2.
	pivot := matricesAndPivot at: 3.
	self assert: q * r closeTo: expectedMatrix.
	self assert: pivot equals: #( 3 4 3 nil )
]

{ #category : #tests }
PMQRTest >> testHorizontalRectangularMatrixCannotBeDecomposed [

	| horizontalRectangularMatrix |
	horizontalRectangularMatrix := PMMatrix rows: { 
			                               { 1. 2. 4 }.
			                               { 5. 6. 7 } }.

	self
		should: [ 
			(PMQRDecomposition of: horizontalRectangularMatrix) ]
		raise: Error
]

{ #category : #tests }
PMQRTest >> testMoorePenroseInverseOfLargeNonRandomMatrixAndItsTranspose [
	| a inverse transposeOfA |
	a := PMMatrix new initializeRows:
		     #( #( 5 40 1 2.5 ) #( 0 0 1 2.5 ) #( 0 0 1 2.5 ) ).
	inverse := a mpInverse .
	self assert: inverse isMoorePenroseInverseOf: a.
	
	transposeOfA := a transpose.
	inverse := transposeOfA mpInverse .
	self assert: inverse isMoorePenroseInverseOf: transposeOfA.
]

{ #category : #tests }
PMQRTest >> testMoorePenroseInverseOfNonRandomMatrix [
	| a inverse |
	a := PMMatrix new initializeRows:
		     #( #( 5 40 1 ) #( 0 0 1 ) #( 0 0 1 ) ).
	inverse := a mpInverse .
	self assert: inverse isMoorePenroseInverseOf: a.
]

{ #category : #tests }
PMQRTest >> testMoorePenroseInverseOfProductOfMatrices [
	| a inverse |
	a := PMMatrix new initializeRows:
		     #( #( 5 40 1 ) #( 0 0 1 ) #( 0 0 1 ) ).
	
	a := a * (PMMatrix rows: 3 columns: 3 random: 5.0).
	inverse := a mpInverse .
	self assert: inverse isMoorePenroseInverseOf: a.
]

{ #category : #tests }
PMQRTest >> testMoorePenroseInverseOfRandomMatrixIsAnInverse [
"
Proofs for the properties below can be found in literature:
If A has real entries, then so does A+
If A is invertible, its pseudoinverse is its inverse. That is, A+ = A**−1
"

	| a |
	a := PMSymmetricMatrix new: 4 random: 1.0.
	self assert: (a mpInverse closeTo: a inverse)
]

{ #category : #tests }
PMQRTest >> testOrthogonalize [

	| a b i |
	i := 0.
	[ 
	a := PMMatrix rows: 5 columns: 5 random: 5.0.
	a rank = 5 ifTrue: [ 
		a atRow: 2 put: (a rowAt: 1) + (3 * (a rowAt: 3)).
		a atRow: 4 put: 3.11 * (a rowAt: 2).
		b := a orthogonalize.
		self assert: b numberOfColumns equals: 3.
		i := i + 1.
		self assert: ((b columnAt: 1) * (b columnAt: 2) closeTo: 0).
		self assert: ((b columnAt: 1) * (b columnAt: 3) closeTo: 0).
		self assert: ((b columnAt: 3) * (b columnAt: 2) closeTo: 0).
		self assert: ((b columnAt: 1) * (b columnAt: 1) closeTo: 1).
		self assert: ((b columnAt: 3) * (b columnAt: 3) closeTo: 1).
		self assert: ((b columnAt: 2) * (b columnAt: 2) closeTo: 1) ].
	i < 10 ] whileTrue
]

{ #category : #tests }
PMQRTest >> testQRFactorization [

	| a qr |
	5 timesRepeat: [ 
		a := PMMatrix rows: 5 columns: 4 random: 10.0.
		qr := a qrFactorization.
		self assert: (a closeTo: qr first * qr second).
		self assert: (qr first squared closeTo:
				 (PMSymmetricMatrix identity: qr first numberOfColumns)).
		2 to: qr second numberOfRows do: [ :r | 
			self assert: (((qr second rowAt: r) first: r - 1) closeTo:
					 (Array new: r - 1 withAll: 0)) ].

		qr := a qrFactorizationWithPivoting.
		self assert:
			(a closeTo: qr first * (qr second inversePivotColumns: (qr at: 3))).
		self assert: (qr first squared closeTo:
				 (PMSymmetricMatrix identity: qr first numberOfColumns)).
		2 to: qr second numberOfRows do: [ :r | 
			self assert: (((qr second rowAt: r) first: r - 1) closeTo:
					 (Array new: r - 1 withAll: 0)) ].

		a := PMSymmetricMatrix new: 4 random: 10.0.
		qr := a qrFactorization.
		self assert: (a closeTo: qr first * qr second).
		self assert: (qr first squared closeTo:
				 (PMSymmetricMatrix identity: qr first numberOfColumns)).
		2 to: qr second numberOfRows do: [ :r | 
			self assert: (((qr second rowAt: r) first: r - 1) closeTo:
					 (Array new: r - 1 withAll: 0)) ].

		qr := a qrFactorizationWithPivoting.
		self assert:
			(a closeTo: qr first * (qr second inversePivotColumns: (qr at: 3))).
		self assert: (qr first squared closeTo:
				 (PMSymmetricMatrix identity: qr first numberOfColumns)).
		2 to: qr second numberOfRows do: [ :r | 
			self assert: (((qr second rowAt: r) first: r - 1) closeTo:
					 (Array new: r - 1 withAll: 0)) ] ]
]

{ #category : #tests }
PMQRTest >> testRank [
	| random randomNumber matrix |
	random := Random new.
	
	10 timesRepeat: [
		matrix := PMMatrix rows: 5 columns: 7 random: 5.0.
		matrix rank = 5 ifTrue: [
			randomNumber := random nextBetween: 0 and: 3.
			matrix atRow: 2 put: (matrix rowAt: 1) + (randomNumber * (matrix rowAt: 3)).
			
			randomNumber := random nextBetween: 0 and: 3.
			matrix atRow: 4 put: (0.5 + randomNumber) * (matrix rowAt: 5).
			
			self assert: matrix rank equals: 3.
			self assert: matrix transpose rank equals: 3 ] ].
]

{ #category : #tests }
PMQRTest >> testSimpleQRDecomposition [

	| a qrDecomposition decomposition |
	a := PMMatrix rows: { 
			     { 12. -51. 4 }.
			     { 6. 167. -68 }.
			     { -4. 24. -41 } }.

	qrDecomposition := PMQRDecomposition of: a.

	decomposition := qrDecomposition decompose.
	decomposition first * decomposition second.
	self assert: decomposition first * decomposition second equals: a
]

{ #category : #tests }
PMQRTest >> testSimpleQRDecompositionWithPivot [

	| a qrDecomposition decomposition expected |
	a := PMMatrix rows: { 
			     { 12. -51. 4 }.
			     { 6. 167. -68 }.
			     { -4. 24. -41 } }.

	qrDecomposition := PMQRDecomposition of: a.

	decomposition := qrDecomposition decomposeWithPivot.
	decomposition first * decomposition second.

	expected := PMMatrix rows: { 
			            { -51. 4. 12 }.
			            { 167. -68. 6 }.
			            { 24. -41. -4 } }.
	self
		assert: decomposition first * decomposition second
		closeTo: expected
]

{ #category : #tests }
PMQRTest >> testVectorHouseholder [

	"result is householdermatrix * v"

	(2 to: 5) do: [ :i | 
		| v h result |
		(1 to: 9) do: [ :unimportant | 
			v := PMVector new: i random: 5.8.
			h := v householder.
			result := (PMSymmetricMatrix identity: i)
			          - ((h at: 1) * (h at: 2) tensorProduct: (h at: 2)) * v.
			self deny: (result first closeTo: 0).
			result allButFirst do: [ :aNumber | 
				self assert: (aNumber closeTo: 0) ] ] ]
]
