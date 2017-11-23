printing
print2On: aStream
	aStream nextPutAll: ' cdf: '.
	compareWith
		ifNil: [ aStream nextPut: $- ]
		ifNotNil: [ popDistribution
				ifNil: [ compareWith printOn: aStream ]
				ifNotNil: [ aStream nextPutAll: 'distributionValue of '.
					popDistribution printOn: aStream ] ].
	aStream nextPut: $)