tests-stepping
testOrderOfBaseExplicitStepperIsOne
	| order |
	order := ExplicitStepper new order.
	self should: [order notNil].
	self should: [order = 1].