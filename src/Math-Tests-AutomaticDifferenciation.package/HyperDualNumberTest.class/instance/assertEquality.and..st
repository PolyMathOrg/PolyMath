running
assertEquality: aDualNumber and: anotherDualNumber
	self assert: aDualNumber equals: anotherDualNumber.
	self assert: aDualNumber exp equals: anotherDualNumber exp.
	self assert: aDualNumber eps2 equals: anotherDualNumber eps2.
	self assert: aDualNumber eps1eps2 equals: anotherDualNumber eps1eps2