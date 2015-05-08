arithmetic
* aHyperDualNumber
|r|
r:=super * aHyperDualNumber.
aHyperDualNumber isDualNumber
	ifFalse:[ r eps2:eps2 * aHyperDualNumber; eps1eps2: eps1eps2 * aHyperDualNumber] 
	ifTrue: [r eps2: eps2 * aHyperDualNumber value + (aHyperDualNumber eps2 *value); eps1eps2: value * aHyperDualNumber eps1eps2 +(eps * aHyperDualNumber eps2)+(eps2 * aHyperDualNumber eps)+(eps1eps2 * aHyperDualNumber value)].
^r