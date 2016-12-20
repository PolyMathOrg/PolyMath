running
resultCollect: aSortedColl withProbs: aMethod
	^ q collect: [ :x | aSortedColl quantile: x withProbs: aMethod ]