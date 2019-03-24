"
This is the test class that exercises scikit-learn Eigenvector Flip Algorithm

"
Class {
	#name : #SciKitLearnEigenvectorFlipAlgorithmTest,
	#superclass : #TestCase,
	#instVars : [
		'u',
		'v'
	],
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #initialization }
SciKitLearnEigenvectorFlipAlgorithmTest >> setUpScikitLearnExample [
"  We compute a matrix of signs for U with which
	we perform a 'dot product' with the original
	matrix V
	(by 'dot product' we mean send the dot: message)
	Example here is taken from Scikit Learn
	
	U = [[-0.21956688  0.53396977]
 		 [-0.35264795 -0.45713538]
 		 [-0.57221483  0.07683439]
 		 [ 0.21956688 -0.53396977]
 	    [ 0.35264795  0.45713538]
 	    [ 0.57221483 -0.07683439]]

   V = [[ 0.83849224  0.54491354]
 		 [ 0.54491354 -0.83849224]]    
	"


	u := PMMatrix rows: #(
		#(-0.21956688 0.53396977) 
		#(-0.35264795 -0.45713538) 
		#(-0.57221483  0.07683439) 
		#( 0.21956688 -0.53396977) 
		#( 0.35264795  0.45713538) 
		#( 0.57221483 -0.07683439)).
	v := PMMatrix rows: #(
		#(0.83849224  0.54491354) 
		#(0.54491354 -0.83849224)).
]

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testComputeSignsFromU [
	"The purpose is to compare the output from fligEigenVectorsSign in
	PolyMath with scikit-learn
	"

	| flipAlgorithm expected signs |
	self setUpScikitLearnExample .
	flipAlgorithm := SciKitLearnEigenvectorFlipAlgorithm flipU: u andV: v.
	
	signs := flipAlgorithm computeSignsFromU .
	
	expected := #(-1 1) asPMVector .
	self assert: signs equals: expected
]

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testSignMatrixForU [
	| signAlgo expected |
	self setUpScikitLearnExample .
	signAlgo := SciKitLearnEigenvectorFlipAlgorithm flipU: u andV: v.
	
	expected := PMMatrix rows: #(#(-1 1) #(-1 1) #(-1 1) #(-1 1) #(-1 1) #(-1 1)).
	self assert: (signAlgo signMatrixForU) equals: expected

]

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testSignMatrixForV [
	| signAlgo expected |
	
	self setUpScikitLearnExample .
	signAlgo := SciKitLearnEigenvectorFlipAlgorithm flipU: u andV: v.
	
	expected := PMMatrix rows: #(#(-1 -1) #(1 1)).
	self assert: (signAlgo signMatrixForV) equals: expected
]

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testUFlipped [
	| signAlgo expected |
	
	self setUpScikitLearnExample .
	signAlgo := SciKitLearnEigenvectorFlipAlgorithm flipU: u andV: v.
	
	expected := PMMatrix rows: #(
						#(0.21956688  0.53396977)
   						#(0.35264795 -0.45713538)
   						#(0.57221483  0.07683439)
 						#(-0.21956688 -0.53396977)
 						#(-0.35264795  0.45713538)
 						#(-0.57221483 -0.07683439)).

	self assert: (signAlgo uFlipped) equals: expected

	
]

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testVFlipped [
	| signAlgo expected |
	
	self setUpScikitLearnExample .
	signAlgo := SciKitLearnEigenvectorFlipAlgorithm flipU: u andV: v.
	
	expected := PMMatrix rows: #(
					 #(-0.83849224 -0.54491354)
 					 #(0.54491354 -0.83849224)).

	self assert: (signAlgo vFlipped) equals: expected

	
]
