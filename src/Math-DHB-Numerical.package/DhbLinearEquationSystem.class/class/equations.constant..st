creation
equations: anArrayOfArrays constant: anArray 

	^ self basicNew 
			initialize: anArrayOfArrays 
			constants: (Array with: anArray)