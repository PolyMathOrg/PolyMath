Class {
	#name : #PMQRTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Matrix'
}

{ #category : #running }
PMQRTest >> mpTestFunction: aMatrix [

	| inverse mult identityMatrix |
	inverse := aMatrix mpInverse.
	identityMatrix := inverse * aMatrix.
	self assert: (aMatrix * identityMatrix closeTo: aMatrix).
	self assert: identityMatrix * inverse closeTo: inverse.
	self assert: identityMatrix transpose closeTo: identityMatrix.
	mult := aMatrix * inverse.
	self assert: mult transpose closeTo: mult
]

{ #category : #tests }
PMQRTest >> testMoorePenroseInverse [

	| a |
	a := PMMatrix new initializeRows:
		     #( #( 5 40 1 ) #( 0 0 1 ) #( 0 0 1 ) ).
	self mpTestFunction: a.
	a := a * (PMMatrix rows: 3 columns: 3 random: 5.0).
	self mpTestFunction: a.
	a := PMMatrix new initializeRows:
		     #( #( 5 40 1 2.5 ) #( 0 0 1 2.5 ) #( 0 0 1 2.5 ) ).
	self mpTestFunction: a.
	a := a transpose.
	self mpTestFunction: a.
	3 timesRepeat: [ 
		a := PMMatrix rows: 3 columns: 3 random: 1.0.
		self assert: (a mpInverse closeTo: a inverse).
		a := PMSymmetricMatrix new: 4 random: 1.0.
		self assert: (a mpInverse closeTo: a inverse) ]
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
