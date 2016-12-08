running
resultCollect: aSortedColl method: aMethod
	^ q collect: [ :x | aSortedColl quantile: x method: aMethod ]