"
This class uses the SciKit-Learn SVD flip algorithm to ensure the signs of the eigenvectors correlate with the trend of the data.
    Instance Variables
	u:		PMMatrix
	v:		PMMatrix

"
Class {
	#name : #SciKitLearnEigenvectorFlipAlgorithm,
	#superclass : #Object,
	#instVars : [
		'u',
		'v',
		'signs'
	],
	#category : #'Math-PrincipalComponentAnalysis'
}

{ #category : #'instance creation' }
SciKitLearnEigenvectorFlipAlgorithm class >> flipU: u andV: v [
	^ self new
		initializeWithU: u andV: v;
		yourself
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> computeSignsFromU [
	| maxAbsCols i maxElements |
	maxAbsCols := u abs argMaxOnColumns.
	i := 0.
	maxElements := u transpose 
		rowsCollect: [ :each | 
			i := i + 1.
			each at: (maxAbsCols at: i) ].
	^ maxElements sign asPMVector 
]

{ #category : #initialization }
SciKitLearnEigenvectorFlipAlgorithm >> initializeWithU: uMatrix andV: vMatrix [
	"instantiate the algorithm"
	u := uMatrix .
	v := vMatrix .
	signs := self computeSignsFromU .


]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> signMatrixForU [
	^ PMMatrix
		rows:
			((1 to: u numberOfRows)
				inject: OrderedCollection new
				into: [ :rows :eachRow | 
					rows
						add: signs;
						yourself ])
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> signMatrixForV [
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

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> signs [
	^ signs
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> uFlipped [
	^ u dot: (self signMatrixForU).
]

{ #category : #accessing }
SciKitLearnEigenvectorFlipAlgorithm >> vFlipped [
	^ v dot: (self signMatrixForV) .
]
