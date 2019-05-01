"
AccuracyTest uses AccuracyTestExample
"
Class {
	#name : #PMAccuracyTest,
	#superclass : #TestCase,
	#instVars : [
		'a',
		'dp'
	],
	#category : #'Math-Tests-Accuracy'
}

{ #category : #'initialize-release' }
PMAccuracyTest >> initialize [ 
	super initialize.
	dp := PMAccuracyTestExample decimalPlaces

]

{ #category : #running }
PMAccuracyTest >> setUp [ 
	a := PMAccuracyTestExample new.
	PMAccuracyTestExample decimalPlaces: 3.
]

{ #category : #running }
PMAccuracyTest >> tearDown [ 
	PMAccuracyTestExample decimalPlaces: dp.

]

{ #category : #tests }
PMAccuracyTest >> testArgumentAt [
	self assert: (a argumentAt: 'Aaa') equals: #(#(false) #(true)).
	self assert: (a argumentAt: 'Bbb') equals: #(#('a') #('AG')).
	self assert: (a argumentAt: 'Ddd') isNil.
	self assert: (a argumentAt: 'Ccc') equals: #(#(1) #(1.1) #(0.9))
]

{ #category : #tests }
PMAccuracyTest >> testArgumentError [
	self should: [ a testArgumentError ] raise: Error
]

{ #category : #tests }
PMAccuracyTest >> testAsArray [
	self assert: (a asArray: 'bla') equals: #('bla').
	self assert: (a asArray: #('bla')) equals: #('bla').
	self
		assert: (a asArray: #('bla') asOrderedCollection)
		equals: #('bla')
]

{ #category : #tests }
PMAccuracyTest >> testCalcDeviationsInMax [
	| r c |
	c := #(#(1 2 3) #(2 3 6)).
	r := {(3 / 2).
	(9 / 4).
	4}.
	self
		assert: (a calcDeviations: r in: c max: false)
		equals:
			{(-100 / 3) asFloat.
			(-100 / 9) asFloat.
			-25}.
	self
		assert: (a calcDeviations: r in: c max: true)
		equals:
			{(100 / 3) asFloat.
			(100 / 3) asFloat.
			50}
]

{ #category : #tests }
PMAccuracyTest >> testCalcErrorOfRealResult [
	self assert: (a calcErrorOf: 0.7 realResult: 0.7) equals: 0.
	self assert: (a calcErrorOf: 0.7 realResult: 0.0) equals: -100.
	self assert: (a calcErrorOf: 1 / 4 realResult: 1 / 2) equals: 100.
	self
		assert: (a calcErrorOf: 0.0 realResult: 7)
		equals: Float infinity.
	self assert: (a calcErrorOf: 0.0 realResult: 0) equals: 0.
	self
		assert: (a calcErrorOf: 0.0 realResult: -1 / 7)
		equals: Float infinity negated
]

{ #category : #tests }
PMAccuracyTest >> testDataTree [
	| s |
	a run.
	self assert: (a dataTree atPath: #('iterations')) equals: 1.
	self
		assert: (a dataTree atPath: #('names' 'data'))
		equals: #('Aaa' 'Bbb' 'Ccc' 'Ddd' 'Eee' 'Fff').
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
				yourself).
	self
		assert: (a dataTree atPath: #('names' 'Aaa' 'data'))
		equals: #(#(1 2) #(3 2.8888)).
	self
		assert: (a dataTree atPath: #('names' 'Bbb' #(3) 'data'))
		equals: #(#(2) #(3)).
	s := a dataTree atPath: #('names' 'Ccc' #(3)).
	self assert: s keys size equals: 5.
	s := a dataTree atPath: #('names' 'Fff' 'error').
	self
		assert: (s copyFrom: 1 to: 4)
		equals:
			{0.
			Float infinity.
			-100.0.
			Float infinity negated}.
	self assert: (s at: 5) isNaN
]

{ #category : #tests }
PMAccuracyTest >> testDecimalPlaces [
	self assert: a class decimalPlaces equals: 3.
	a class decimalPlaces: 2.
	self assert: a class decimalPlaces equals: 2
]

{ #category : #tests }
PMAccuracyTest >> testExtractFromResultsWhichOnlyOne [
	self
		assert: (a extractFromResults: #('bla' 'blah') which: 2 onlyOne: false)
		equals: 'blah'.
	self assert: a testGetterAaa second equals: #(true).
	self
		assert: (a extractFromResults: #('bla' 'blah') which: 1 onlyOne: true)
		equals: #('bla' 'blah').
	self assert: a testGetterAaa second equals: #(#(false) #(true))
]

{ #category : #tests }
PMAccuracyTest >> testExtremeCollectionmax [
	| c |
	c := #(4 4 2).
	self
		assert: (a extremeCollection: c max: true)
		equals: {Float infinity negated}.
	self
		assert: (a extremeCollection: c max: false)
		equals: {Float infinity}.
	self
		assert: (a extremeCollection: {c} max: false)
		equals:
			{Float infinity.
			Float infinity.
			Float infinity}
]

{ #category : #tests }
PMAccuracyTest >> testFormat [
	self
		assert: (a format: #(1 'rez' 1.8899))
		equals: #('1.0' 'rez' '1.89').
	self
		assert: (a format: #(10 100 0.18899 0.018899))
		equals: #('10.0' '1.0e2' '0.189' '1.89e-2').
	self assert: (a format: Float infinity) equals: #('Infinity').
	self assert: (a format: 0 - Float infinity) equals: #('-Infinity')
]

{ #category : #tests }
PMAccuracyTest >> testFormatTypePostfix [
	| r |
	r := a format: #(1 'rez' 1.8899) type: 'x' postfix: '%%'.
	self assert: r contents equals: 'x: 1.0%% , rez%% , 1.89%% '.
	r := a format: #(1.8899 true) type: '' postfix: nil.
	self
		assert: r contents
		equals: 'x: 1.0%% , rez%% , 1.89%% : 1.89 , true '
]

{ #category : #tests }
PMAccuracyTest >> testFormatTypePostfixTree [
	| t |
	t := KeyedTree new.
	self
		assert:
			(a
				format: #(100.0 'rez' 0.18899)
				type: 'x'
				postfix: '%%'
				tree: t) contents
		equals: 'x: 1.0e2%% , rez%% , 0.189%% '.
	self
		assert: t
		equals:
			(KeyedTree new
				at: 'x' put: #(100.0 'rez' 0.18899);
				yourself)
]

{ #category : #tests }
PMAccuracyTest >> testGetters [
	| r |
	r := a testGetterAaa.
	self
		assert: r
		equals: #(#(#(1 2) #(3 2.8888)) #(#(false) #(true)) #(#(5 3) #(4 4)) 2 2).
	r := a testGetterBbb.
	self
		assert: r
		equals: #(#(#(1) #(3)) #(#('a') #('AG')) #(#(2) #(3)) 2 2).
	#(#(#(1) #(3)) #(#(1) #(2)) #(#(2) #(3)) 2 2)
]

{ #category : #tests }
PMAccuracyTest >> testIfSeveralterations [
	a iterations: 2.
	self assert: (a ifSeveralterations: [ 1 ]) equals: 1.
	a iterations: 1.
	self assert: (a ifSeveralterations: [ 1 ]) equals: a
]

{ #category : #tests }
PMAccuracyTest >> testIterations [
	| s d |
	a
		iterations: 2;
		run.
	d := a dataTree at: 'names'.
	s := (d atPath: #('Aaa' #(1 2) #(5 3) '+dev')) first negated.
	self
		assert: ((d atPath: #('Aaa' #(1 2) #(5 3) '-dev')) first closeTo: s).
	s := d atPath: #('Aaa' #(3 2.8888) #(5 3) 'standard deviation').
	self assert: s first > 0.
	self assert: s second equals: 0.
	self assert: (d atPath: #('Ddd' 'data')) equals: #(#(2 3) #(2 3)).
	s := d atPath: #('Ddd' 'error').
	self assert: (s first closeTo: -45).
	self assert: (s second closeTo: -26.6666667)
]

{ #category : #tests }
PMAccuracyTest >> testNumberOfDifferentParametersAt [
	self assert: (a numberOfDifferentParametersAt: 'Aaa') equals: 2.
	self assert: (a numberOfDifferentParametersAt: 'Ccc') equals: 2.
	self assert: (a numberOfDifferentParametersAt: 'Ddd') equals: 1.
	self assert: (a numberOfDifferentParametersAt: 'Fff') equals: 1
]

{ #category : #tests }
PMAccuracyTest >> testNumberOfDifferentResultsAt [
	self assert: (a numberOfDifferentResultsAt: 'Aaa') equals: 2.
	self assert: (a numberOfDifferentResultsAt: 'Bbb') equals: 2.
	self assert: (a numberOfDifferentResultsAt: 'Ccc') equals: 3.
	self assert: (a numberOfDifferentResultsAt: 'Ddd') equals: 1.
	self assert: (a numberOfDifferentResultsAt: 'Eee') equals: 2
]

{ #category : #tests }
PMAccuracyTest >> testParameterAt [
	self assert: (a parameterAt: 'Aaa') equals: #(#(1 2) #(3 2.8888)).
	self assert: (a parameterAt: 'Bbb') equals: #(#(1) #(3)).
	self assert: (a parameterAt: 'Ddd') isNil.
	self assert: (a parameterAt: 'Fff') isNil
]

{ #category : #tests }
PMAccuracyTest >> testParameterError [
self should: [a testParameterError ]raise: Error
]

{ #category : #tests }
PMAccuracyTest >> testPrintOn [
	| s |
	s := WriteStream on: String new.
	a printOn: s.
	self assert: s contents equals: 'a PMAccuracyTestExample ()'.
	s reset.
	a run.
	a printOn: s.
	self
		assert:
			(s contents
				beginsWith:
					'a PMAccuracyTestExample (
Report for: PMAccuracyTestExample')
]

{ #category : #tests }
PMAccuracyTest >> testReport [
	self assert: a report equals: ''.
	a run.
	self assert: (a report beginsWith: 'Report for: PMAccuracyTestExample')
]

{ #category : #tests }
PMAccuracyTest >> testResultError [
self should: [a testResultError ]raise: Error
]

{ #category : #tests }
PMAccuracyTest >> testResultsKeyForAtPosition [
	self assert: (a resultsKeyFor: 'Aaa' AtPosition: 2) equals: #(4 4).
	self assert: (a resultsKeyFor: 'Bbb' AtPosition: 1) equals: #(2).
	a run.
	self
		assert:
			(a dataTree
				atPath:
					{'names'.
					'Ccc'.
					#(1).
					(a resultsKeyFor: 'Ccc' AtPosition: 1).
					'arguments'})
		equals: 1.
	self
		assert:
			(a dataTree
				atPath:
					{'names'.
					'Ccc'.
					#(1).
					(a resultsKeyFor: 'Ccc' AtPosition: 3).
					'arguments'})
		equals: 0.9.
	self assert: (a resultsKeyFor: 'Eee' AtPosition: 2) equals: #(1 3).
	self
		assert: (a resultsKeyFor: 'Fff' AtPosition: 1)
		equals: #(0 1 0 -2 3)
]

{ #category : #tests }
PMAccuracyTest >> testRun [
	a run.
	a run: 'Bbb'.
	self assert: (a dataTree atPath: #('names' 'data')) equals: #('Bbb').
	self
		assert:
			(a report
				beginsWith:
					'Report for: PMAccuracyTestExample
test Bbb').
	a run: #('Ccc' 'Eee').
	self
		assert: (a dataTree atPath: #('names' 'data'))
		equals: #('Ccc' 'Eee')
]

{ #category : #tests }
PMAccuracyTest >> testSetUp [
	self assert: a count equals: 0.
	a performCheck: 'Fff'.
	self assert: a count equals: 4 / 5.
	a iterations: 3.
	a performCheck: 'Ccc'.
	self assert: a count equals: 16 / 5
]

{ #category : #tests }
PMAccuracyTest >> testTreeTypeData [
	| aTree |
	aTree := KeyedTree new.
	self assert: (a tree: aTree type: 'aa' data: 'bb') equals: aTree.
	self
		assert: aTree
		equals:
			(KeyedTree new
				at: 'data' put: 'bb';
				at: 'type' put: 'aa';
				yourself)
]

{ #category : #tests }
PMAccuracyTest >> testperformCheck [
	| b |
	a extractFromResults: 'bla' which: 2 onlyOne: false.	"for setting numberOfResults"
	self assert: (a performCheck: 'Aaa') equals: #(#(1 1)).
	a extractFromResults: 'bla' which: 1 onlyOne: true.	"for setting numberOfResults"
	a iterations: 3.
	b := a performCheck: 'Fff'.
	self assert: b first first equals: 0.
	self assert: b second third equals: 1.
	self assert: (b third at: 5) isNaN
]
