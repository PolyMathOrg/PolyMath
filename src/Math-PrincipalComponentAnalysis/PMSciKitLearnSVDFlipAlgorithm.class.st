"
This class uses the SciKit-Learn SVD flip algorithm to ensure the signs of the eigenvectors correlate with the trend of the data.
    Instance Variables
	u:		PMMatrix
	v:		PMMatrix

"
Class {
	#name : 'PMSciKitLearnSVDFlipAlgorithm',
	#superclass : 'Object',
	#instVars : [
		'u',
		'v',
		'signs'
	],
	#category : 'Math-PrincipalComponentAnalysis',
	#package : 'Math-PrincipalComponentAnalysis'
}

{ #category : 'instance creation' }
PMSciKitLearnSVDFlipAlgorithm class >> flipU: u andV: v [
	^ self new
		initializeWithU: u andV: v;
		yourself
]

{ #category : 'accessing' }
PMSciKitLearnSVDFlipAlgorithm >> computeSignsFromU [
	| maxAbsCols i maxElements |
	maxAbsCols := u abs argMaxOnColumns.
	i := 0.
	maxElements := u transpose
		rowsCollect: [ :each |
			i := i + 1.
			each at: (maxAbsCols at: i) ].
	^ maxElements sign asPMVector
]

{ #category : 'initialization' }
PMSciKitLearnSVDFlipAlgorithm >> initializeWithU: uMatrix andV: vMatrix [
	"instantiate the algorithm"
	u := uMatrix .
	v := vMatrix .
	signs := self computeSignsFromU
]

{ #category : 'accessing' }
PMSciKitLearnSVDFlipAlgorithm >> signMatrixForU [
	^ PMMatrix
		rows:
			((1 to: u numberOfRows)
				inject: OrderedCollection new
				into: [ :rows :eachRow |
					rows
						add: signs;
						yourself ])
]

{ #category : 'accessing' }
PMSciKitLearnSVDFlipAlgorithm >> signMatrixForV [
	| signsForV |
	signsForV := self signs copyFrom: 1 to: v numberOfColumns.
	^ (PMMatrix
		rows:
			((1 to: v numberOfRows)
				inject: OrderedCollection new
				into: [ :rows :eachRow |
					rows
						add: signsForV;
						yourself ])) transpose
]

{ #category : 'accessing' }
PMSciKitLearnSVDFlipAlgorithm >> signs [
	^ signs
]

{ #category : 'accessing' }
PMSciKitLearnSVDFlipAlgorithm >> uFlipped [
	^ u hadamardProduct: (self signMatrixForU)
]

{ #category : 'accessing' }
PMSciKitLearnSVDFlipAlgorithm >> vFlipped [
	^ v hadamardProduct: (self signMatrixForV)
]
