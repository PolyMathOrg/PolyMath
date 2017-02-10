A PMIterativeProcess class is an abstract base class for processes which follow an iterative pattern. 

Subclasses of PMIterativeProcess will redefine
	initializeIterations
	evaluateIteration
	finalizeIterations

The instance variable result is used to store the most recent/best result, and is accessible through the result selector.

The maximumIterations: method allows control of the amount of work this method is allowed to do. Each evaluation of the iteration increments the instance variable iterations. When this number exceeds maximumIterations, the evaluate method will stop the process, and answer result.
