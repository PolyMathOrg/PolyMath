Class {
	#name : #ButcherTableauStepper,
	#superclass : #Stepper,
	#instVars : [
		'stageIncrements',
		'stageCoefficients',
		'stageWeights'
	],
	#category : 'Math-ODE'
}

{ #category : #'instance creation' }
ButcherTableauStepper class >> eulerStepper [
	| a b |
	a := PMMatrix rows: #((0)).
	b := #(1).
	^ self stageWeights: b stageCoefficients: a.
]

{ #category : #'instance creation' }
ButcherTableauStepper class >> kuttaThreeEighthsStepper [
	| a b |
	a := PMMatrix rows: #((0 0 0 0) ((1 / 3) 0 0 0) ((-1 / 3 ) 1 0 0) (0 1 -1 1)).
	b := #((1 / 8) (3 / 8) (3 / 8) (1 / 8)).
	^ self stageWeights: b stageCoefficients: a.
]

{ #category : #'instance creation' }
ButcherTableauStepper class >> rungeKuttaStepper [
	| a b |
	a := PMMatrix rows: #((0 0 0 0) (0.5 0 0 0) (0 0.5 0 0) (0 0 1 0)).
	b := #((1 / 6) (1 / 3) (1 / 3) (1 / 6)).
	^ self stageWeights: b stageCoefficients: a.
]

{ #category : #'instance creation' }
ButcherTableauStepper class >> rungeStepper [
	| a b |
	a := PMMatrix rows: #((0 0) (0.5 0)).
	b := #(0 1).
	^ self stageWeights: b stageCoefficients: a.
]

{ #category : #'instance creation' }
ButcherTableauStepper class >> stageWeights: anArray stageCoefficients: aMatrix [
	| c |
	"stageWeights is the array b, stageCoefficients is the lower triangular matrix A"
	self assert: [anArray sum = 1].
	"we can calculate the stage increments from the coefficient matrix"
	c := Array new: anArray size.
	(1 to: c size) do: [:i | 
		c at: i put: ((aMatrix rowAt: i) sum)].
	
	^ self new stageIncrements: c;
		 stageCoefficients: aMatrix;
		stageWeights: anArray;
		yourself.
]

{ #category : #stepping }
ButcherTableauStepper >> doStep: aStateTime stepSize: dt [
	"not complete"
	| stages stageCount stateDifference|
	self isInitialized.
	stageCount := stageIncrements size.
	stages := Array new: stageCount.
	(1 to: stageCount) do:
	[:i | | sum |
		sum ifNil: [sum := 0]. 
		(1 to:  i - 1) do: 
			[:j | sum := sum + ((stages at: j ) * stageCoefficients at: i at: j)].
	stages at: i put:  
		(system 
			state: aStateTime state +  (dt * sum)  
			time: aStateTime time + (dt * stageIncrements at: i) )].
	stateDifference := (dt * ((1 to: stageCount) do: [:i | | sum | 
			sum ifNil: [sum := 0].
			sum := sum + (( stageWeights at: i) * (stages at: i)) ])).
	^ aStateTime state + stateDifference.
]

{ #category : #stepping }
ButcherTableauStepper >> doStep: aState time: aTime stepSize: dt [
	^ self doStep: (StateTime state: aState time: aTime) stepSize: dt.
]

{ #category : #assertion }
ButcherTableauStepper >> isInitialized [
	self assert: [stageCoefficients notNil].
	self assert: [stageIncrements notNil].
	self assert: [stageWeights notNil].
	self assert: [system notNil].
	^ self
]

{ #category : #accessing }
ButcherTableauStepper >> stageCoefficients [
	^ stageCoefficients
]

{ #category : #accessing }
ButcherTableauStepper >> stageCoefficients: aMatrix [
	stageCoefficients := aMatrix

]

{ #category : #accessing }
ButcherTableauStepper >> stageIncrements [
	^ stageIncrements
]

{ #category : #accessing }
ButcherTableauStepper >> stageIncrements: anArray [
	stageIncrements := anArray
	

]

{ #category : #accessing }
ButcherTableauStepper >> stageWeights [
	^ stageWeights
]

{ #category : #accessing }
ButcherTableauStepper >> stageWeights: anArray [
	stageWeights := anArray

]
