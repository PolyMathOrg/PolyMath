tests
testError
	self
		should: [ a quantile: 0.5 withProbs: #(1 -1 0) ]
		raise: Error
		whoseDescriptionIncludes: 'SubscriptOutOfBounds'
		description: 'Wrong error message'
