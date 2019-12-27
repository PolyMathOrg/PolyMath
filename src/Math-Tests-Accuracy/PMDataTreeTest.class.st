"
Class Name: PMDataTreeTest 

Responsibility: exercising the PMAccuracyTestExample's 
dataTree message

Collaborators: PMAccuracyTestExample 
"
Class {
	#name : #PMDataTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'dp',
		'a'
	],
	#category : #'Math-Tests-Accuracy'
}

{ #category : #initialization }
PMDataTreeTest >> initialize [ 
	super initialize.
	dp := PMAccuracyTestExample decimalPlaces
]

{ #category : #running }
PMDataTreeTest >> setUp [ 
	super setUp.
	a := PMAccuracyTestExample new.
	PMAccuracyTestExample decimalPlaces: 3.
]

{ #category : #running }
PMDataTreeTest >> tearDown [ 
	super tearDown.
	PMAccuracyTestExample decimalPlaces: dp.
]

{ #category : #tests }
PMDataTreeTest >> testDataTree [
	| s |
	a run.
	s := a dataTree atPath: #('names' 'Ccc' #(3)).
	self assert: s keys size equals: 5.
	s := a dataTree atPath: #('names' 'Fff' 'error').
	self
		assert: (s copyFrom: 1 to: 4)
		equals: (Array with: 0 with: Float infinity with: -100.0 with: Float infinity negated).
	self assert: (s at: 5) isNaN
]

{ #category : #tests }
PMDataTreeTest >> testThatDataForAaaIsTheCorrespondingParameter [
	| parameterForAaa |
	a run.
	
	parameterForAaa := #(#(1 2) #(3 2.8888)).
	self
		assert: (a dataTree atPath: #('names' 'Aaa' 'data'))
		equals: parameterForAaa.
]

{ #category : #tests }
PMDataTreeTest >> testThatKeyedTreeContainsArgsDataErrorResultsAndType [
	"SMELL - it's not easy to determine the true purpose of the
	test and, perhaps with the exception of the 'expected result', 
	how input leads to the output. The test also contains many
	'magic' numbers.
	"
	a run.
	self
		assert: (a dataTree atPath: #('names' 'Aaa' #(1 2) #(4 4)))
		equals:
			(KeyedTree new
				at: 'arguments' put: true;
				at: 'data' put: #(#(1 1));
				at: 'error' put: #(300.0 300.0);
				at: 'expected result' put: #(4 4);
				at: 'result' put: #(1 1);
				at: 'type' put: 'result';
				yourself)
]

{ #category : #tests }
PMDataTreeTest >> testThatRunIncrementsTheNumberOfIterations [
	"SMELL - we're really testing run, it seems."
	a run.
	self assert: (a dataTree atPath: #('iterations')) equals: 1.
]

{ #category : #tests }
PMDataTreeTest >> testThatTheDataForBbbIsTheDefaultResult [
	"SMELL - magic number. This may be coincidental, but the 
	expected result in this test is that set in 
	PMAccuracyTestExample's initialize method.
	"
	| defaultResultAtInitialisation |
	a run.
	defaultResultAtInitialisation := #(#(2) #(3)).
	self
		assert: (a dataTree atPath: #('names' 'Bbb' #(3) 'data'))
		equals: defaultResultAtInitialisation
]

{ #category : #tests }
PMDataTreeTest >> testThatTheNamesAreInitialisationKeys [
	a run.
	self
		assert: (a dataTree atPath: #('names' 'data'))
		equals: #('Aaa' 'Bbb' 'Ccc' 'Ddd' 'Eee' 'Fff')
]
