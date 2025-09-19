"
This is the test class that exercises scikit-learn Eigenvector Flip Algorithm

"
Class {
	#name : 'PMSciKitLearnSVDFlipAlgorithmTest',
	#superclass : 'TestCase',
	#instVars : [
		'u',
		'v',
		'flipAlgorithm'
	],
	#category : 'Math-Tests-PrincipalComponentAnalysis',
	#package : 'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : 'running' }
PMSciKitLearnSVDFlipAlgorithmTest >> setUp [
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

	super setUp.


	u := PMMatrix rows:
		     #( #( -0.21956688 0.53396977 ) #( -0.35264795 -0.45713538 ) #( -0.57221483 0.07683439 ) #( 0.21956688 -0.53396977 ) #( 0.35264795 0.45713538 )
		        #( 0.57221483 -0.07683439 ) ).
	v := PMMatrix rows: #( #( 0.83849224 0.54491354 ) #( 0.54491354 -0.83849224 ) ).

	flipAlgorithm := PMSciKitLearnSVDFlipAlgorithm flipU: u andV: v
]

{ #category : 'scikit-learn-example' }
PMSciKitLearnSVDFlipAlgorithmTest >> testComputeSignsFromU [
	"The purpose is to compare the output from fligEigenVectorsSign in
	PolyMath with scikit-learn
	"

	| expected signs |

	signs := flipAlgorithm computeSignsFromU.

	expected := #(-1 1) asPMVector.
	self assert: signs equals: expected
]

{ #category : 'scikit-learn-example' }
PMSciKitLearnSVDFlipAlgorithmTest >> testSignMatrixForU [
	| expected |
	expected := PMMatrix rows: #(#(-1 1) #(-1 1) #(-1 1) #(-1 1) #(-1 1) #(-1 1)).

	self assert: (flipAlgorithm signMatrixForU) equals: expected
]

{ #category : 'scikit-learn-example' }
PMSciKitLearnSVDFlipAlgorithmTest >> testSignMatrixForV [
	| expected |
	expected := PMMatrix rows: #(#(-1 -1) #(1 1)).

	self assert: (flipAlgorithm signMatrixForV) equals: expected
]

{ #category : 'scikit-learn-example' }
PMSciKitLearnSVDFlipAlgorithmTest >> testUFlipped [
	| expected |
	expected := PMMatrix rows: #(
						#(0.21956688  0.53396977)
   						#(0.35264795 -0.45713538)
   						#(0.57221483  0.07683439)
 						#(-0.21956688 -0.53396977)
 						#(-0.35264795  0.45713538)
 						#(-0.57221483 -0.07683439)).

	self assert: (flipAlgorithm uFlipped) equals: expected
]

{ #category : 'scikit-learn-example' }
PMSciKitLearnSVDFlipAlgorithmTest >> testVFlipped [
	| expected |
	expected := PMMatrix rows: #(#(-0.83849224 -0.54491354) #(0.54491354 -0.83849224)).

	self assert: flipAlgorithm vFlipped equals: expected
]
