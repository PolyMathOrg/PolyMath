accessing
jacobiTransform 

	^  jacobiTransform ifNil: [ jacobiTransform := PMJacobiTransformation matrix: accumulatorForCovarianceMatrix covarianceMatrix ]