"
GeneralFunctionFit fits a function to some data. the data has to be a collection of points x@f(x). the fitting minimizes by default the squared error, but it can also do more robust regressions. GeneralFunctionFit can also deal with local minima. if you have a function with many parameters you might want to enlarge the populationSize and/or the maximumIterations. if the result is not exact enough, it is faster and often sufficient to rerun #evaluate.
f:=[:x :a :b |x squared sin squared -b/ (a+x squared)].
col:=(-2.5 to: 2.5 by:0.25)collect: [:i|i@(f cull: i cull: 2 cull: 3 )].
fit:= GeneralFunctionFit function: f data: col minimumValues: #(0 0) maximumValues: #(10 10) .
fit evaluate . 
fit result  .  --> #(2.0000000000000413 3.000000000000014)
"
Class {
	#name : #PMGeneralFunctionFit,
	#superclass : #Object,
	#instVars : [
		'manager',
		'errorFunction',
		'result',
		'firstResult',
		'verbose',
		'data',
		'dataTruncated',
		'geneticOptimizer'
	],
	#category : #'Math-FunctionFit'
}

{ #category : #creation }
PMGeneralFunctionFit class >> function: aBlock data: aCollectionOfPoints minimumValues: anArray maximumValues: anotherArray [
(aBlock isBlock and:[aBlock numArgs > 1]) ifFalse:
	[^self error: 'aBlock must be a Block with one independent variable and at least one parameter' ].
^self new
	function: aBlock;
	data: (aCollectionOfPoints as: PMDataHolder);
	minValues: anArray maxValues: anotherArray;
	yourself
]

{ #category : #util }
PMGeneralFunctionFit class >> range: anArray size: anInteger type: string [
^anArray isNumber
	ifTrue: [Array new: anInteger withAll: anArray ]
	ifFalse: [anArray isCollection
		ifTrue: [anArray size=anInteger
			ifTrue: [anArray]
			ifFalse: [self error:  'minimum or maximum values dont have correct sizes'] ]
		ifFalse: [self error: (string, ' values is no collection or number')]]
]

{ #category : #accessing }
PMGeneralFunctionFit >> data: aCollectionOfPoints [
"the data, a collection of x@f(x), used to estimate the parameters"
self resetResult .
data :=aCollectionOfPoints.
dataTruncated:=false.
^errorFunction data: aCollectionOfPoints
]

{ #category : #accessing }
PMGeneralFunctionFit >> dataTruncated [
^dataTruncated
]

{ #category : #accessing }
PMGeneralFunctionFit >> error [
"returns the sqrt of the mean of the sum of squared errors, or the mean abs error, or the quartile error, or the insensitive error"
result ifNil: [^nil].
^self error: result
]

{ #category : #accessing }
PMGeneralFunctionFit >> error: parameters [
"returns the error for any parameter array; for example if you want to compare the error of the result with the error of the 'real' parameters"
^errorFunction realValue: parameters
]

{ #category : #accessing }
PMGeneralFunctionFit >> errorCollection [
	^ result
		ifNil: [ Error signal: 'run "self evaluate" first' ]
		ifNotNil: [ :r | self optimizer functionBlock errorCollection: r ]
]

{ #category : #accessing }
PMGeneralFunctionFit >> errorType [
^errorFunction errorType
]

{ #category : #accessing }
PMGeneralFunctionFit >> errorType: aSymbol [
	"defines what kind of fitting should be used. valid errorTypes are: #squared, #abs, #insensitive, #quartile, #median. Default is #squared"
self resetResult.
^errorFunction errorType: aSymbol
]

{ #category : #operation }
PMGeneralFunctionFit >> evaluate [

	| ff |
	ff := PMErrorMinimizer function: errorFunction.
	firstResult := [
	               ff evaluate.
	               ff parameters ] onErrorDo: [
		               verbose ifTrue: [ self inform: 'ErrorMinimizer was not successful' ].
		               nil ].
	firstResult ifNotNil: [ geneticOptimizer addPointAt: firstResult ].
	firstResult := geneticOptimizer evaluate.
	self errorType = #squared ifTrue: [ ff := PMFunctionFit function: errorFunction function data: errorFunction data ].
	ff parameters: firstResult.
	ff desiredPrecision: PMFloatingPointMachine new machinePrecision.
	ff maximumIterations: 1000.
	result := [
	          ff evaluate.
	          ff parameters ] onErrorDo: [
		          verbose ifTrue: [ self inform: 'last FunctionFit was not successful' ].
		          ff result parameters ].
	(errorFunction value: result) > (errorFunction value: firstResult) ifTrue: [
		ff := result.
		result := firstResult.
		firstResult := ff.
		verbose ifTrue: [ self inform: 'first result was better than final result' ] ].
	^ result
]

{ #category : #operation }
PMGeneralFunctionFit >> findQuartile [
| errorCol d2 max v n|
(#(#quartile #insensitive) includes: self errorType ) ifFalse:
	[^ Error signal: 'errorType has to be set to #quartile or #insensitive' ].
dataTruncated ifTrue: [errorFunction data: data. dataTruncated :=false]. "necessary"
(data size - errorFunction parameterSize)<7 ifTrue: [^ Error signal: 'datasize to small'].
max:= 0.999.
v:=verbose .
verbose:=false.
n:=0.
[	self quartile: max.
	self evaluate.
	errorCol:= self errorCollection sort.
	d2:=(errorFunction parameterSize to: (errorCol size -4) ) collect: [:i|
		Array
			with: (i+2)
			with: ((2*(errorCol at: i)) - (errorCol at: i+1) - (2*(errorCol at: i+2))- (errorCol at: i+3)+(2*(errorCol at: i+4))) ].
	[max :=#(5 0).
	d2 do: [:d|((d at: 2) >= (max at:2)) ifTrue: [max :=d]].
	(max first = (d2 last first))ifTrue: [
		(d2 size =1)ifTrue: [^ Error signal: 'findQuartile unsolvable'].
		d2 := (d2 copyFrom: 1 to:(d2 size  -1)).
		true ] ifFalse:[false] .] whileTrue.
	max :=(max first / errorCol size) .
	n:=n+1.
	((max <self quartile ) ifTrue: [true] ifFalse: [(max =self quartile)ifTrue: [false] ifFalse: [n<5] ])
		ifTrue: [v ifTrue: [self inform: 'found quartile: ' , max asString ].true] ifFalse:[false] .
 	] whileTrue.
verbose :=v.
^self evaluate
]

{ #category : #accessing }
PMGeneralFunctionFit >> function [
"does usually not return the originally entered block, but a SimpleParameterFunction with the parameters set to the result"
|f|
f :=errorFunction function .
^result ifNil: [f] ifNotNil: [PMSimpleParameterFunction function: f parameters: result]
]

{ #category : #accessing }
PMGeneralFunctionFit >> function: aBlock [
	"sets the function to be fitted. the first value has to be the independent variable, further values are the parameters to be fitted. only one independent variable is allowed (if you have several independent vars or eg a function of a vector, that returns another vector, have a look at the 'spiral' example)."
self resetResult.
errorFunction function: aBlock
]

{ #category : #initialization }
PMGeneralFunctionFit >> initialize [

	super initialize.
	errorFunction := PMErrorOfParameterFunction new.
	manager := PMAnotherChromosomeManager new
		           populationSize: 50;
		           yourself.
	geneticOptimizer := (PMAnotherGeneticOptimizer minimizingFunction: errorFunction)
		                    chromosomeManager: manager;
		                    maximumIterations: 170;
		                    yourself.
	self errorType: #squared.
	verbose := false.
	dataTruncated := false
]

{ #category : #accessing }
PMGeneralFunctionFit >> manager [
"if you want to change parameters of AnotherChromosomeManager, that are not directly available in GeneralFunctionFit"
^manager
]

{ #category : #accessing }
PMGeneralFunctionFit >> maximumIterations: anInteger [
"default is 170."
geneticOptimizer maximumIterations: anInteger.
^anInteger
]

{ #category : #accessing }
PMGeneralFunctionFit >> minValues: anArray maxValues: anotherArray [
"instead of an array one can also use a number, an array will then be filled with this number. eg one can use 0 instead of the tiresome #(0 0 0 0). minValues and maxValues need not  be absolutely correct. also results outside of this range, but nearby, will often be found."
	|array1 array2 aSize|
aSize := errorFunction function numArgs-1.
array1 := self class range: anArray size: aSize type: 'minimum'.
array2 :=self class range: anotherArray size: aSize type: 'maximum'.
(array2 - array1 allSatisfy: [:each| each >0]) ifFalse:
	[^DomainError signal: 'maximum values should be greater than minimum values'].
self resetResult.
manager origin: array1.
manager range: (array2 - array1)
]

{ #category : #accessing }
PMGeneralFunctionFit >> optimizer [
"if you want to change parameters of AnotherGeneticOptimizer not directly available in GeneralFunctionFit"
^geneticOptimizer
]

{ #category : #accessing }
PMGeneralFunctionFit >> populationSize: anInteger [
" if you have a lot of parameters (essentially beginning with 3 parameters), you may want to enlarge the populationsize. default is only 50. eg for 3 parameters, you might want set this to 300"
self resetResult.
manager populationSize: anInteger .
^anInteger
]

{ #category : #accessing }
PMGeneralFunctionFit >> precision [
"not really useful to look at, you might better look at #error"
^geneticOptimizer precision
]

{ #category : #printing }
PMGeneralFunctionFit >> printOn: aStream [
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name;
		nextPut: $(;
		print: geneticOptimizer;
		nextPutAll: ' with data of size: ';
	  	print: data size .
	 dataTruncated ifTrue:
		[aStream nextPutAll: ' truncated to: '; print: self optimizer functionBlock data size] .
       aStream nextPut: $)
]

{ #category : #accessing }
PMGeneralFunctionFit >> quartile [
^errorFunction quartile
]

{ #category : #accessing }
PMGeneralFunctionFit >> quartile: aFloat [
"quartile: is used by errortypes #quartile and #insensitive. if you set quartile to 1, it does not make much sense to use #insensitive, since #insensitive is much slower than #quartile and calculating the tube radius is not quite correct for #insensitive in this special case (it will leave out one datapoint )."
self resetResult.
^errorFunction quartile: aFloat
]

{ #category : #accessing }
PMGeneralFunctionFit >> relativeError: aBoolean [
"by default false"
self resetResult .
^errorFunction relativeError: aBoolean
]

{ #category : #operation }
PMGeneralFunctionFit >> resetBestPoints [
"for repeated evaluating with different starting populations"
self resetResult
]

{ #category : #operation }
PMGeneralFunctionFit >> resetData [
self data: data
]

{ #category : #private }
PMGeneralFunctionFit >> resetResult [
result :=nil.
firstResult :=nil.
geneticOptimizer resetBestPoints
]

{ #category : #accessing }
PMGeneralFunctionFit >> result [
"the fitted parameters"
result ifNil: [self evaluate ].
^result
]

{ #category : #accessing }
PMGeneralFunctionFit >> secondaryResult [
"not really necessary"
^firstResult
]

{ #category : #operation }
PMGeneralFunctionFit >> truncateData [
|ec ei |
dataTruncated ifTrue: [^Error signal:'data is already truncated'].
ec:=self errorCollection .
ei:=(ec withIndexCollect: [:e :i| Array with: e with: i]).
ei:=(ei sort:[:a :b|a first<b first]) collect: [:e|e second ].
ei :=ei copyFrom: 1 to: (self quartile * ec size) truncated.
self resetResult.
dataTruncated:=true.
^self optimizer functionBlock data: (ei collect: [:i|self optimizer functionBlock data at: i])
]

{ #category : #accessing }
PMGeneralFunctionFit >> verbose: aBoolean [
" by default false. if set it to true, you will get some tiresome messages"
verbose :=aBoolean
]
