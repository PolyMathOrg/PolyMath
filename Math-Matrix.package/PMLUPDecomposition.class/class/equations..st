creation
equations: anArrayOfArrays
	^ self new initialize: (anArrayOfArrays collect: [ :each | each copy ])