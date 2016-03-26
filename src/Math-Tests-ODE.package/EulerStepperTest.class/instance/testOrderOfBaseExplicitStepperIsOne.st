tests-stepping
testOrderOfBaseExplicitStepperIsOne
	| order |
	order := ExplicitStepper new order.
	self assert: order notNil.
	self assert: order equals: 1