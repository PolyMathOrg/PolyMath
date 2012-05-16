initialization
initialize
		"Private - initializes the receiver with standard settings.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	freeExtent := false.
	cacheSize := self class defaultCacheSize.
	desiredNumberOfBins := self class defaultNumberOfBins.
	contents := OrderedCollection new: cacheSize.
	moments := DhbFixedStatisticalMoments new.
	overflow := 0.
	underflow := 0.
	^self