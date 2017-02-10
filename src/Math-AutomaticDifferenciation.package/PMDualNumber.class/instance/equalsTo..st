comparing
equalsTo: aDualNumber
	^ (value equalsTo: aDualNumber value) and: [ eps equalsTo: aDualNumber eps ]