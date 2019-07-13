"
Accuracy is a framework for testing the numerical accuracy of the results of methods.

"
Class {
	#name : #PMAccuracy,
	#superclass : #Object,
	#instVars : [
		'arguments',
		'parameters',
		'names',
		'results',
		'iterations',
		'numberOfResults',
		'numberOfParameters',
		'aStream',
		'dataTree'
	],
	#classVars : [
		'DecimalPlaces'
	],
	#category : 'Math-Accuracy-Core'
}

{ #category : #accessing }
PMAccuracy class >> decimalPlaces [
^DecimalPlaces
]

{ #category : #accessing }
PMAccuracy class >> decimalPlaces: anInteger [ 
^DecimalPlaces:=anInteger 
]

{ #category : #util }
PMAccuracy class >> floatAsShortString: aFloat [
^self floatAsShortString: aFloat digitCount: DecimalPlaces
]

{ #category : #util }
PMAccuracy class >> floatAsShortString: aFloat digitCount: digitCount [ 
"essentially copied fromFloat>>absPrintOn:base:digitCount:"
	| fuzz x exp q fBase scale logScale xi aStream posFloat |
	aFloat isNaN ifTrue:[^'NaN'].
	aFloat =0 ifTrue:[^'0.0'].
	aStream:=WriteStream on:''.
	posFloat :=aFloat <0 
		ifTrue:[aStream nextPut: $-.aFloat negated]
		ifFalse:[aFloat ].
	posFloat isInfinite ifTrue: [aStream nextPutAll: 'Infinity'.
		^ aStream contents].
	fBase := 10.0.
	"x is myself normalized to [1.0, fBase), exp is my exponent"
	exp := 
		posFloat  < 1.0
			ifTrue: [posFloat reciprocalFloorLog: fBase]
			ifFalse: [posFloat floorLog: fBase].
	scale := 1.0.
	logScale := 0.
	[(x := fBase raisedTo: (exp + logScale)) = 0]
		whileTrue:
			[scale := scale * fBase.
			logScale := logScale + 1].
	x := posFloat * scale / x.
	fuzz := fBase raisedTo: 1 - digitCount.
	"round the last digit to be printed"
	x := 0.5 * fuzz + x.
	x >= fBase
		ifTrue: 
			["check if rounding has unnormalized x"
			x := x / fBase.
			exp := exp + 1].
	(exp < (digitCount-1) and: [exp > (-2) ])
		ifTrue: 
			["decimal notation"
			q := 0.
			exp < 0 ifTrue: [1 to: 1 - exp do: [:i | aStream nextPut: ('0.' at:i)]]]
		ifFalse: 
			["scientific notation"
			q := exp.
			exp := 0].
	[x >= fuzz]
		whileTrue: 
			["use fuzz to track significance"
			xi := x asInteger.
			aStream nextPut: (Character digitValue: xi).
			x := x - xi asFloat * fBase.
			fuzz := fuzz * fBase.
			exp := exp - 1.
			exp = -1 ifTrue: [aStream nextPut: $.]].
	[exp >= -1]
		whileTrue: 
			[aStream nextPut: $0.
			exp := exp - 1.
			exp = -1 ifTrue: [aStream nextPut: $.]].
	q ~= 0
		ifTrue: 
			[aStream nextPut: $e.
			q printOn: aStream].
	^ aStream contents
]

{ #category : #'class initialization' }
PMAccuracy class >> initialize [ 
DecimalPlaces ifNil: [DecimalPlaces :=3].
]

{ #category : #accessing }
PMAccuracy >> argument [
	| r |
	r := self argumentAt: self findKey.
	numberOfResults ifNotNil: [ :rn | r := r at: rn ].
	^ r
]

{ #category : #accessing }
PMAccuracy >> argument: anArgument [
	arguments
		at: self findKey
		put: (anArgument ifNotNil: [ :a | self asArray: a ]).
	^ anArgument
]

{ #category : #accessing }
PMAccuracy >> argumentAt: aName [
	| ar |
	ar := arguments at: aName ifAbsent: [ arguments at: 'AllTheRest' ifAbsent: [ nil ] ].
	(ar isCollection and: [ ar isEmpty ])
		ifTrue: [ ar := nil ].
	^ ar
]

{ #category : #private }
PMAccuracy >> asArray: aCol [ 
	^(aCol isCollection and: [ aCol isSequenceable and: [aCol isString not] ])  
		ifTrue: [ aCol asArray ] 
		ifFalse: [ {aCol} ]
]

{ #category : #private }
PMAccuracy >> calcDeviations: aValue in: aCol max: aBoolean [
	| c |
	c := self extremeCollection: aCol max:aBoolean .
 	c := aCol inject: c into: [:a :b| a with: b collect: [:a1 :b1| 
		aBoolean 
			ifTrue: [ a1 max: b1 ] 
			ifFalse: [a1 min: b1]]].
	^ c with: aValue collect: [:rr :r| self calcErrorOf: r realResult: rr ]
]

{ #category : #private }
PMAccuracy >> calcErrorOf: aResult realResult: aRResult [
	^ aResult = 0 
		ifTrue: [aRResult =0 
			ifTrue: [0] 
			ifFalse: [aRResult >0 
				ifTrue: [ Float infinity]
				ifFalse: [Float infinity negated ]]] 
		ifFalse:[ 100.0 * ( aRResult - aResult ) /aResult ]
]

{ #category : #running }
PMAccuracy >> calcResult: aName tree: aTree [
	| aResult c|
	c := self performCheck: aName.
	self tree: aTree type: 'result' data: c .
	aResult := c average.
	self ifSeveralterations: [aStream <<'mean '] .
	(self format: aResult type: 'result' postfix: nil tree: aTree)space.
	self ifSeveralterations: [ self streamDeviationsOfResult: aResult inCollection: c tree: aTree].
	^ aResult 
]

{ #category : #accessing }
PMAccuracy >> dataTree [
	^ dataTree
]

{ #category : #running }
PMAccuracy >> displayProgress: anArrayOfNames [
	'Checking'
		displayProgressFrom: 1 
		to: anArrayOfNames size 
		during: [ :bar | anArrayOfNames do: [ :n | 
					bar label: 'Checking ' , n.
					bar increment.
					self streamTest: n ] ].
	^ self
]

{ #category : #private }
PMAccuracy >> extractFromResults: theResults which: num onlyOne: aBoolean [
	| aResult |
	numberOfResults := aBoolean 
		ifTrue: [ aResult := theResults. nil ]
		ifFalse: [ aResult := theResults at: num.	num ].
	^ aResult
]

{ #category : #private }
PMAccuracy >> extremeCollection: acol max:aBoolean [ 
	|c|
	c := acol first.
	c := c isCollection ifTrue: [c size] ifFalse: [1]. 
	^ Array new: c withAll: (aBoolean 
										ifTrue: [ Float infinity negated ] 
										ifFalse: [ Float infinity ])
]

{ #category : #private }
PMAccuracy >> findKey [
	| s selector matchingMessage |
	s := thisContext sender.
	selector := s sender method selector.
	selector = 'initialize'
		ifTrue: [ ^ 'AllTheRest' ].
	matchingMessage := names
		detect: [ :name | selector endsWith: name ]
		ifNone: [ self error: (s method selector join: ' called in wrong context') ].
	^ matchingMessage
]

{ #category : #printing }
PMAccuracy >> format: aCollection [
	|col|
	col:= self asArray: aCollection.
	^col collect: [ :a | a isNumber 
			ifTrue: [ self class floatAsShortString: a ]
			ifFalse: [ a ] ].

]

{ #category : #printing }
PMAccuracy >> format: aCollection type: aString postfix: pf [
	| c |
	c := self format: aCollection.
	aStream << aString <<': '<< (c joinUsing: (pf ifNil: [ ' , ' ] ifNotNil: [ pf , ' , ' ])).
	pf ifNotNil: [ aStream << pf ].
	^aStream space.
]

{ #category : #printing }
PMAccuracy >> format: aCollection type: aString postfix: pf tree: aTree [
	self format: aCollection type: aString postfix: pf.
	aTree at:aString put: (aCollection size=1 ifTrue:[aCollection first] ifFalse:[aCollection]).
	^aStream 
]

{ #category : #private }
PMAccuracy >> ifSeveralterations: aBlock [
	iterations >1 ifTrue:[ ^aBlock value ].

]

{ #category : #'initialize-release' }
PMAccuracy >> initRest: aName [
	| initializationMessage |
	initializationMessage := ('initialize' , aName) asSymbol.
	(self respondsTo: initializationMessage)
		ifFalse: [ ^ self ].
	self perform: initializationMessage
]

{ #category : #'initialize-release' }
PMAccuracy >> initSubclassSelectorNames [
	names := (self class allSelectorsBelow: Object)
		select: [ :selectorName | selectorName beginsWith: #check ]
		thenCollect: [ :selectorName | selectorName copyFrom: 6 to: selectorName size ].
	names := names asArray sort
]

{ #category : #'initialize-release' }
PMAccuracy >> initialize [
	parameters := Dictionary new.
	arguments := Dictionary new.
	results := Dictionary new.
	self initSubclassSelectorNames.
	names do: [ :name | self initRest: name ].
	aStream := WriteStream with: ''.
	iterations := 1.
	dataTree := KeyedTree new.
	
]

{ #category : #accessing }
PMAccuracy >> iterations: anInteger [ 
anInteger <1 ifTrue:[^iterations].
^iterations :=anInteger 
]

{ #category : #accessing }
PMAccuracy >> numberOfDifferentParametersAt: aname [
"parameters have to be in a collection, even a single parameter.
never returns 0"
|no|
no := parameters at: aname  ifAbsent: [parameters at: 'AllTheRest' ifAbsent: [^1]].
no isCollection ifFalse: [^1].
^no size max: 1
]

{ #category : #accessing }
PMAccuracy >> numberOfDifferentResultsAt: aname [
	|no|
	no := self resultsAt: aname.
	no isCollection ifFalse:[no:={no}].
	^ no first isCollection ifTrue: [ no size ] ifFalse: [ 1 ]
]

{ #category : #accessing }
PMAccuracy >> occurrencesOf: key In: aResults UpTo: anInteger [
	^ (aResults copyFrom: 1 to: anInteger) occurrencesOf: key
]

{ #category : #accessing }
PMAccuracy >> parameter [
	| r |
	r := self parameterAt: self findKey.
	numberOfParameters ifNotNil: [ :rn | r := r at: rn ].
	^ r
]

{ #category : #accessing }
PMAccuracy >> parameter: aParameter [
	(aParameter isArray or: [ aParameter isNil ])
		ifFalse: [ self error: 'parameter must be an Array' ].
	(aParameter isArray and: [ aParameter size = 1 ])
		ifTrue: [ self error: 'parameter of size 1 is not possible' ].
	^ parameters at: self findKey put: aParameter 
]

{ #category : #accessing }
PMAccuracy >> parameterAt: aName [
	| par |
	par := parameters at: aName ifAbsent: [ parameters at: 'AllTheRest' ifAbsent: [ nil ] ].
	(par isCollection and: [ par isEmpty ])
		ifTrue: [ par := nil ].
	^ par 
]

{ #category : #running }
PMAccuracy >> performCheck: aName [
	^ (1 to: iterations)
		collect: [ :i | [ Processor yield. self setUp. self asArray: (self perform: ('check' , aName) asSymbol) ]
				ensure: [ self tearDown ]]
]

{ #category : #printing }
PMAccuracy >> printOn: aStream1 [
	super printOn: aStream1.
	self report
		ifEmpty: [ aStream1 nextPutAll: ' ()' ]
		ifNotEmpty: [ :c | 
			aStream1
				nextPutAll:
					' (
';
				nextPutAll: c;
				nextPutAll: ' )' ]
]

{ #category : #streaming }
PMAccuracy >> putExpectedResult: anExpectedResult totree: aTree [
	| e |
	e := anExpectedResult.
	[ (aTree at: e ifPresent: [ Array new: e size + 1 ])
		ifNil: [ ^ aTree at: e put: KeyedTree new ]
		ifNotNil: [ :a | 
			a
				replaceFrom: 1
					to: e size
					with: e
					startingAt: 1;
				at: a size put: $+.
			e := a.
			false ] ] whileFalse
]

{ #category : #printing }
PMAccuracy >> report [
	^ aStream contents  

]

{ #category : #accessing }
PMAccuracy >> result: aResult [
	results at: self findKey put: (self asArray: aResult).
	^ aResult 

]

{ #category : #accessing }
PMAccuracy >> resultsAt: aName [
	^ results at: aName ifAbsent: [ results at: 'AllTheRest' ifAbsent: [ nil ] ] 
]

{ #category : #accessing }
PMAccuracy >> resultsKeyFor: aName AtPosition: anInteger [
	"utility to construct the key to look for in docu. see testResultsKeyAtPosition."

	| aResults repetitions key result |
	aResults := self resultsAt: aName.
	key := aResults at: anInteger.
	key isArray
		ifFalse: [ ^ aResults ].
	repetitions := self occurrencesOf: key In: aResults UpTo: anInteger - 1.
	result := (Array new: key size + repetitions)
		replaceFrom: 1
		to: key size
		with: key
		startingAt: 1.
	key size + 1 to: result size do: [ :i | result at: i put: $+ ].
	^ result
]

{ #category : #running }
PMAccuracy >> run [
	^self run: names
]

{ #category : #running }
PMAccuracy >> run: anArrayOfNames [
	|a|
	a := self asArray: anArrayOfNames.
	(names includesAll: a) ifFalse: [ NotFound signalFor: a in: names ].
	aStream reset;
		<< 'Report for: ';
		<< self class name;
		cr.
	self ifSeveralterations: [ aStream << 'iterations: '	<< iterations; cr ].
	(self tree: dataTree removeAll type: self class name data: 'names')
		at: 'iterations' put: iterations;
		at: 'names' put: (self tree: KeyedTree new type: 'names' data: a).
	self displayProgress: a.
	^ aStream contents
]

{ #category : #running }
PMAccuracy >> setUp [
	"It is the subclass' responsibility to set up the necessary environment for a check"
	^ self
]

{ #category : #streaming }
PMAccuracy >> severalChecksOn: aName with: anExpectedResult tree: aTree [
	| aResult  error |
	aResult := self calcResult: aName tree: aTree .
	error := aResult isCollection
		ifTrue: [ aResult with: anExpectedResult collect: [ :r :e | self calcErrorOf: r realResult: e ] ]
		ifFalse: [ self calcErrorOf: aResult realResult: anExpectedResult ].
	(self format: error type: 'error' postfix: '%' tree: aTree) cr; cr.

]

{ #category : #streaming }
PMAccuracy >> streamArgumentsAt: anInteger for: aName tree: aTree [
	| ar |
	ar := self argumentAt: aName.
	ar
		ifNil: [ aStream cr ]
		ifNotNil: [ :a | 
			(self
				format: (a at: anInteger)
				type: 'arguments'
				postfix: nil
				tree: aTree) cr ]
]

{ #category : #streaming }
PMAccuracy >> streamDeviationsOfResult: aResult inCollection: aCollection tree: aTree [
	|sd| 
	self format: (self calcDeviations: aResult in: aCollection max: true) type:'+dev' postfix:'%'tree: aTree.
	(self format: (self calcDeviations: aResult in: aCollection max: false) type: '-dev' postfix:'%'tree: aTree) cr.
	sd := aCollection first isCollection 
		ifTrue: [(1 to: aCollection first size) collect: [:k| (aCollection collect:[:j| j at: k ]) stdev ]. ] 
		ifFalse:[aCollection stdev].
	(self format:  sd type: 'standard deviation' postfix:nil tree: aTree) cr.
]

{ #category : #streaming }
PMAccuracy >> streamResultsFor: aName tree: aTree single: oneResult [
	| anExpectedResult aNewTree |
	1 to: (self numberOfDifferentResultsAt: aName) do: [ :num | 
		anExpectedResult := self extractFromResults: (self resultsAt: aName) which: num onlyOne: oneResult.
		aNewTree := oneResult ifTrue: [ aTree ] ifFalse: [ self putExpectedResult: anExpectedResult totree: aTree ].
		self format: anExpectedResult type: 'expected result' postfix: nil tree: aNewTree.
		self streamArgumentsAt: num for: aName tree: aNewTree.
		self severalChecksOn: aName with: anExpectedResult tree: aNewTree ]
]

{ #category : #streaming }
PMAccuracy >> streamTest: aName [
	| pno namesTree subTree oneResult|
	namesTree := (dataTree at: 'names') at: aName put: (subTree := KeyedTree new).
	pno := self numberOfDifferentParametersAt: aName.
	oneResult := (self numberOfDifferentResultsAt: aName) = 1.
	aStream << 'test '	<< aName;	cr.
	1 to: pno do: [ :parameterNo | 
		pno > 1 ifTrue: [ subTree:=self streamTest: aName withParameter: parameterNo tree: namesTree ].
		oneResult ifFalse: [ self tree: subTree type: 'expected result' data: (self resultsAt: aName) ].
		self streamResultsFor: aName tree: subTree single: oneResult ] 
]

{ #category : #streaming }
PMAccuracy >> streamTest: aName withParameter: parameterNo tree: d [
	| aParameter tree |
	self tree: d type: 'parameter' data: (aParameter := self parameterAt: aName).
	numberOfParameters := parameterNo.
	aParameter := aParameter at: parameterNo.
	d at: aParameter put: (tree := KeyedTree new).
	(self format: aParameter type: 'parameter' postfix: nil) cr.
	^ tree
]

{ #category : #running }
PMAccuracy >> tearDown [
	"It is the subclass' responsibility to clean up the environment after a check "
	^ self
]

{ #category : #private }
PMAccuracy >> tree: aTree type: aString data: aData [ 
	aTree at: 'type' put: aString.
	aTree at: 'data' put: aData.
	^ aTree
]
