testing
isDirty
	
	^ self workingCopy
		ifNil: [ false ]
		ifNotNilDo: [ :wc | wc modified ]