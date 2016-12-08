tests
testError
self should: [a quantile: 0.5 method:#(1 -1 0)] raise: Error whoseDescriptionIncludes: 'method: ',#(1 -1 0)asString description: 'wrong error message'