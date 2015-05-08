arithmetic
* aDualNumber
^aDualNumber isDualNumber
	ifFalse:[self class value: value * aDualNumber eps: eps *aDualNumber]
	ifTrue:[self class value: value * aDualNumber value eps: eps * aDualNumber value + (aDualNumber eps *value)]