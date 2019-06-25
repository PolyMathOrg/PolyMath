"
See http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html

"" To get a pseudo-random float ""
MersenneTwisterRandom new next. 

"" To get a pseudo-random integer ""
MersenneTwisterRandom new nextInteger.


"
Class {
	#name : #PMMersenneTwisterRandomGenerator,
	#superclass : #PMPseudoRandomNumberGenerator,
	#instVars : [
		'states',
		'mti'
	],
	#classVars : [
		'DefaultLengthVector',
		'Mt19937LowerMask',
		'Mt19937Mask',
		'Mt19937MatrixA',
		'Mt19937UpperMask',
		'PeriodParameter',
		'TemperingMaskB',
		'TemperingMaskC'
	],
	#category : #'Math-Random'
}

{ #category : #'class initialization' }
PMMersenneTwisterRandomGenerator class >> initialize [
	" self initialize "

	DefaultLengthVector := 624.
	Mt19937LowerMask := 2147483647.
	Mt19937Mask := 4294967295.
	Mt19937MatrixA := 16r9908B0DF.	" 2567483615 "
	Mt19937UpperMask := 16r80000000. " 2147483648 "
	PeriodParameter := 397.
	TemperingMaskB := 16r9D2C5680.	" 2636928640 "
	TemperingMaskC := 16rEFC60000.  " 4022730752 "


]

{ #category : #initialization }
PMMersenneTwisterRandomGenerator >> initialize [
	"Initialize the receiver state vector and multiplier"

	states := Array new: DefaultLengthVector.
	mti := 1.
	states at: 1 put: ( self seed bitAnd: Mt19937Mask ).
	2 to: DefaultLengthVector
		do: [ :multIndex | 
			states 
				at: multIndex 
				put: ( 16r6C078965 * 
						( ( states at: multIndex - 1 ) 
							bitXor: ( ( states at: multIndex - 1 ) bitShift: 30 negated ) ) + multIndex ).			
			states 
				at: multIndex 
				put: ( ( states at: multIndex ) bitAnd: Mt19937Mask )
      ]

]

{ #category : #'stream access' }
PMMersenneTwisterRandomGenerator >> next [
    "Private - Answer a pseudo-Random float number
	four times faster than rand() ff period 2**19937-1.  "

   ^ self nextFloat

]

{ #category : #accessing }
PMMersenneTwisterRandomGenerator >> nextFloat [
  "Answer a random float number in the interval [ 0 , 1 ]"

  ^ self nextInteger * ( 1.0 / (4294967295.0 * 2 ))
]

{ #category : #accessing }
PMMersenneTwisterRandomGenerator >> nextFloat: limit [
  "Answer a random float number in the interval [ 0 , limit ]"

  ^ self nextFloat * limit
]

{ #category : #accessing }
PMMersenneTwisterRandomGenerator >> nextFloatExcludeUpper [
  "Answer a random float number in the interval [ 0 , 1 )"

  ^ self nextInteger * (1.0 / (4294967296.0 * 2))
]

{ #category : #accessing }
PMMersenneTwisterRandomGenerator >> nextFloatExcludeUpper: limit [
  " Answer a random float number in the interval [ 0 , limit ) "

  ^ self nextFloatExcludeUpper * limit
]

{ #category : #private }
PMMersenneTwisterRandomGenerator >> nextInteger [
	"Answer a random integer on [0,0xffffffff] interval"

	| tempArray y |
	tempArray := Array withAll: #(0 16r9908B0DF).
	mti >= DefaultLengthVector
		ifTrue: [ mti = (DefaultLengthVector + 1)
				ifTrue: [ self seed: 5489.
					self initialize ].
			1 to: DefaultLengthVector - PeriodParameter do: [ :kk | 
				y := ((states at: kk) bitAnd: Mt19937UpperMask)
					bitOr: ((states at: kk + 1) bitAnd: Mt19937LowerMask).
				states
					at: kk
					put:
						(((states at: kk + PeriodParameter) bitXor: (y bitShift: 1 negated))
							bitXor: (tempArray at: (y bitAnd: 1) + 1)) ].
			DefaultLengthVector - PeriodParameter + 1 to: DefaultLengthVector - 2
			do: [ :kk | 
				y := ((states at: kk) bitAnd: Mt19937UpperMask)
					bitOr: ((states at: kk + 1) bitAnd: Mt19937LowerMask).
				states
					at: kk
					put:
						(((states at: kk + PeriodParameter - DefaultLengthVector + 1)
							bitXor: (y bitShift: 1 negated))
							bitXor: (tempArray at: (y bitAnd: 1) + 1)) ].
			y := ((states at: DefaultLengthVector) bitAnd: Mt19937UpperMask)
				bitOr: ((states at: 1) bitAnd: Mt19937LowerMask).
			states
				at: DefaultLengthVector
				put:
					((states at: PeriodParameter)
						bitXor: ((y bitShift: 1) bitXor: (tempArray at: (y bitAnd: 1) + 1))).
			mti := 0 ].
	y := self temperAt: mti + 1.
	mti := mti + 1.
	^ y
]

{ #category : #'stream access' }
PMMersenneTwisterRandomGenerator >> peek [
	"Answer the same as next without changing state"
	
	^ self copy next
	
]

{ #category : #private }
PMMersenneTwisterRandomGenerator >> temperAt: position [
	| y |
	y := states at: position.
	y := y bitXor: (y bitShift: 11 negated).
	y := y bitXor: ((y bitShift: 7 negated) bitAnd: TemperingMaskB).
	y := y bitXor: ((y bitShift: 15 negated) bitAnd: TemperingMaskC).
	y := y bitXor: (y bitShift: 18 negated).
	^ y
]
