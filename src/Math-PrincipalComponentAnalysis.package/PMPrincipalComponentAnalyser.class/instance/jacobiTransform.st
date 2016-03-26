accessing
jacobiTransform 

	^  jacobiTransform ifNil: [ jacobiTransform := DhbJacobiTransformation matrix: accumulatorForCovarianceMatrix covarianceMatrix ]