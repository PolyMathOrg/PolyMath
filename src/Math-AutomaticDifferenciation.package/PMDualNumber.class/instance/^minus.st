arithmetic
- aDualNumber
^aDualNumber isDualNumber
	ifFalse:[self class value: value - aDualNumber eps: eps]
	ifTrue:[self class value: value - aDualNumber value eps: eps - aDualNumber eps]