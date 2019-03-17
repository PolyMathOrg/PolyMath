"
This is the test class that exercises scikit-learn Eigenvector Flip Algorithm

"
Class {
	#name : #SciKitLearnEigenvectorFlipAlgorithmTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testComputeSignsFromU [
	"The purpose is to compare the output from fligEigenVectorsSign in
	PolyMath with scikit-learn
	"

	| m u v flipAlgorithm svd expected signs |
	m := PMMatrix rows: #(#(-1 -1) #(-2 -1) #(-3 -2) #(1 1) #(2 1) #(3 2)).
	svd := PMSingularValueDecomposition new initialize: m.
	u := svd leftSingularForm.
	v := svd rightSingularForm.
	flipAlgorithm := SciKitLearnEigenvectorFlipAlgorithm u: u v: v.
	
	signs := flipAlgorithm computeSignsFromU .
	
	expected := #(-1 1 1 1 1 1) asPMVector .
	self assert: signs equals: expected
]

{ #category : #tests }
SciKitLearnEigenvectorFlipAlgorithmTest >> testSignMatrixForV [
	"We compute a matrix of signs for V with which
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

	| u v signAlgo signs expected |
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
	signs := #(-1 1 1 1 1 1) asPMVector .
	signAlgo := SciKitLearnEigenvectorFlipAlgorithm u: u v: v.
	
	
	expected := PMMatrix rows: #(#(-1 1) #(-1 1)).
	self assert: (signAlgo signMatrixForV: signs) equals: expected
]
