"
These tests use the example from:
https://prod-ng.sandia.gov/techlib-noauth/access-control.cgi/2007/076422.pdf

X =  [  4  22   3    5]
        [  1    5    1   1]
        [11 69 10 14]
        [11 69 10 14]

The expected output is the computation carried out by Scikit-Learn's SVD flip algorithm.
"
Class {
	#name : #PMScikitLearnSVDFlipAlgorithmSandiaTest,
	#superclass : #TestCase,
	#instVars : [
		'u',
		'v',
		'flipAlgorithm'
	],
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #initialization }
PMScikitLearnSVDFlipAlgorithmSandiaTest >> setUp [
	u:= PMMatrix rows: #(
	 		 #(-3.37888092e-01  7.97390517e-01 -5.00000000e-01 -7.29361893e-17)
 			 #(-6.39157626e-01 -5.84360787e-01 -5.00000000e-01 -6.37482349e-17)
 			 #(4.88522859e-01 -1.06514865e-01 -5.00000000e-01 -7.07106781e-01)
 			 #(4.88522859e-01 -1.06514865e-01 -5.00000000e-01  7.07106781e-01)
		).
	
	v := PMMatrix rows: #(
  			 #(0.1480984   0.96040168  0.13728871  0.19195647)
 			 #(0.43936626 -0.13130934 -0.54106008  0.70496038)
 			 #(-0.42589859  0.24444267 -0.8129595  -0.31297767)
 			 #(-0.77693921 -0.02518437  0.16583923  0.60681839)
		  ).
	
	flipAlgorithm := PMSciKitLearnSVDFlipAlgorithm flipU: u andV: v.
]

{ #category : #'sandia-example' }
PMScikitLearnSVDFlipAlgorithmSandiaTest >> testSignMatrixForU [
	| expected |
	self setUp.

	expected := PMMatrix
		rows:
			#(#(-1 1 -1 -1) #(-1 1 -1 -1) #(-1 1 -1 -1) #(-1 1 -1 -1)).

	self assert: flipAlgorithm signMatrixForU equals: expected
]

{ #category : #'sandia-example' }
PMScikitLearnSVDFlipAlgorithmSandiaTest >> testSignMatrixForV [
	| expected |
	self setUp.

	expected := PMMatrix
		rows:
			#(#(-1 -1 -1 -1) #(1 1 1 1) #(-1 -1 -1 -1) #(-1 -1 -1 -1)).
	
	self assert: flipAlgorithm signMatrixForV equals: expected
]
