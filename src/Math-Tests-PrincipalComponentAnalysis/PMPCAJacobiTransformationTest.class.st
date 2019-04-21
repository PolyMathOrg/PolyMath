Class {
	#name : #PMPCAJacobiTransformationTest,
	#superclass : #TestCase,
	#instVars : [
		'pca'
	],
	#category : #'Math-Tests-PrincipalComponentAnalysis'
}

{ #category : #running }
PMPCAJacobiTransformationTest >> setUp [
	pca := PMPrincipalComponentAnalyserJacobiTransformation new componentsNumber: 2.
	
]

{ #category : #'scikit-learn-example' }
PMPCAJacobiTransformationTest >> testTransformMatrix [
	| m expected |
	m := PMMatrix
		rows: #(#(-1 -1) #(-2 -1) #(-3 -2) #(1 1) #(2 1) #(3 2)).
	
	pca fit: m.
	
	expected := (PMMatrix
		rows: #(#(-0.83849224 -0.54491354) #(0.54491354 -0.83849224))) abs.
	self assert: pca transformMatrix abs closeTo: expected
]

{ #category : #'lindsay-smith-pca-tutorial' }
PMPCAJacobiTransformationTest >> testTransformWithMeanCentredMeasurements [
	| meanCentredData transformedData expected |
	meanCentredData := PMMatrix rows: #(
			#(0.69 0.49) 
			#(-1.31 -1.21) 
			#(0.39 0.99) 
			#(0.09  0.29) 
			#(1.29 1.09) 
			#(0.49 0.79) 
			#(0.19 -0.31) 
			#(-0.81 -0.81) 
			#(-0.31 -0.31) 
			#(-0.71 -1.01)
		  ).

	pca fit: meanCentredData.	
	transformedData := pca transform: meanCentredData.
	
	expected := PMMatrix rows: #(
						#(-0.827970186 -0.175115307) 
						#(1.77758033 0.142857227) 
						#(-0.992197494 0.384374989) 
						#(-0.274210416 0.130417207) 
						#(-1.67580142 -0.209498461) 
						#(-0.912949103 0.175282444) 
						#(0.0991094375 -0.349824698) 
						#(1.14457216 0.0464172582) 
						#(0.438046137 0.0177646297) 
						#(1.22382056 -0.162675287)).
	self assert: (transformedData abs) closeTo: expected abs.
]
