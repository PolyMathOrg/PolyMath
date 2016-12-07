A PMFunctionalIterator is an abstract base class for IterativeProcesses operating on a function. In the sense of these classes, a function is a block or object responding to the value: selector. 

Subclasses will redefine (in addition to methods prescribed in IterativeProcess)
	computeInitialValues 

New instances may be created with the function: class method, or existing instances may be assigned a new function with setFunction:

All functions are required to be single argument blocks, so multivariable functions must be wrapped in a way that value: takes an array of values as input.

