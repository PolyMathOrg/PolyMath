"
Define usual physics constants

"
Class {
	#name : #PMConstant,
	#superclass : #Object,
	#classVars : [
		'AvogadroConstant',
		'BoltzmannConstant',
		'PlanckConstant',
		'PlanckConstantWithBar',
		'RydbergConstant',
		'StefanBoltzmannConstant',
		'WienDisplacementLawConstant',
		'electricConstant',
		'electronMass',
		'elementaryCharge',
		'fineStructure',
		'gasConstant',
		'gravitationalConstant',
		'magneticConstant',
		'neutronMass',
		'protonMass',
		'speedOfLight',
		'standardAccelerationOfGravity'
	],
	#category : #'Math-Physics-Constants'
}

{ #category : #constants }
PMConstant class >> AvogadroConstant [
	^ AvogadroConstant
]

{ #category : #constants }
PMConstant class >> BoltzmannConstant [
	^ BoltzmannConstant
]

{ #category : #constants }
PMConstant class >> PlanckConstant [
	^ PlanckConstant
]

{ #category : #constants }
PMConstant class >> PlanckConstantWithBar [
	^ PlanckConstantWithBar
]

{ #category : #constants }
PMConstant class >> RydbergConstant [
	^ RydbergConstant
]

{ #category : #constants }
PMConstant class >> StefanBoltzmannConstant [
	^ StefanBoltzmannConstant
]

{ #category : #constants }
PMConstant class >> WienDisplacementLawConstant [
	^ WienDisplacementLawConstant
]

{ #category : #constants }
PMConstant class >> c [
	^ speedOfLight
]

{ #category : #constants }
PMConstant class >> electricConstant [
	^ electricConstant
]

{ #category : #constants }
PMConstant class >> electronMass [
	^ electronMass
]

{ #category : #constants }
PMConstant class >> elementaryCharge [
	^ elementaryCharge
]

{ #category : #constants }
PMConstant class >> fineStructure [
	^ fineStructure
]

{ #category : #constants }
PMConstant class >> gasConstant [
	^ gasConstant
]

{ #category : #constants }
PMConstant class >> gravitationalConstant [
	^ gravitationalConstant
]

{ #category : #constants }
PMConstant class >> h [
	^ PlanckConstant
]

{ #category : #'class initialization' }
PMConstant class >> initialize [
	
	AvogadroConstant := 6.022140857e23.
	BoltzmannConstant := 1.38064852e-23.
	StefanBoltzmannConstant := 5.670367e-8.
	electricConstant := 8.854187817620389e-12.
	elementaryCharge := 1.6021766208e-19.
	electronMass := 9.10938356e-31.
	fineStructure := 0.0072973525664.
	gasConstant := 8.3144598.
	gravitationalConstant := 6.67408e-11.
	magneticConstant := 1.2566370614359173e-6.
	neutronMass := 1.674927471e-27.
	PlanckConstant := 3.990312711e-34.
	PlanckConstantWithBar := PlanckConstant/2*(Float pi).
	protonMass := 1.672621898e-27.
	speedOfLight := 299792458.0.
	standardAccelerationOfGravity := 9.80665.
	WienDisplacementLawConstant := 2.8977729e-3.
	RydbergConstant := 10973731.568508.
]

{ #category : #constants }
PMConstant class >> magneticConstant [
	^ magneticConstant
]

{ #category : #constants }
PMConstant class >> neutronMass [
	^ neutronMass
]

{ #category : #constants }
PMConstant class >> protonMass [
	^ protonMass
]

{ #category : #constants }
PMConstant class >> speedOfLight [
	^ speedOfLight
]

{ #category : #constants }
PMConstant class >> standardAccelerationOfGravity [
	^ standardAccelerationOfGravity
]
