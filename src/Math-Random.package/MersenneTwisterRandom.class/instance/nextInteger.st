private
nextInteger
	" Answer a random integer on [0,0xffffffff] interval "

	| tempArray y |
	tempArray := Array withAll: #(0 16r9908B0DF).
	mti >= DefaultLengthVector
		ifTrue: [ 
			mti = (DefaultLengthVector + 1)
				ifTrue: [ 
					self seed: 5489.
					self initialize ].
			1 to: DefaultLengthVector - PeriodParameter do: [ :kk | 
				y := ((states at: kk) bitAnd: Mt19937UpperMask) bitOr: ((states at: kk + 1) bitAnd: Mt19937LowerMask).
				states
					at: kk
					put:
						(((states at: kk + PeriodParameter) bitXor: (y bitShift: 1 negated)) bitXor: (tempArray at: (y bitAnd: 16r1) + 1)) ].
			DefaultLengthVector - PeriodParameter + 1 to: DefaultLengthVector - 2 do: [ :kk | 
				y := ((states at: kk) bitAnd: Mt19937UpperMask) bitOr: ((states at: kk + 1) bitAnd: Mt19937LowerMask).
				states
					at: kk
					put:
						(((states at: kk + PeriodParameter - DefaultLengthVector + 1) bitXor: (y bitShift: 1 negated))
							bitXor: (tempArray at: (y bitAnd: 16r1) + 1)) ].
			y := ((states at: DefaultLengthVector) bitAnd: Mt19937UpperMask) bitOr: ((states at: 1) bitAnd: Mt19937LowerMask).
			states
				at: DefaultLengthVector
				put: ((states at: PeriodParameter) bitXor: ((y bitShift: 1) bitXor: (tempArray at: (y bitAnd: 16r1) + 1))).
			mti := 0 ].
	y := states at: mti + 1.
	mti := mti + 1.
	y := y bitXor: (y bitShift: 11 negated).
	y := y bitXor: ((y bitShift: 7 negated) bitAnd: TemperingMaskB).
	y := y bitXor: ((y bitShift: 15 negated) bitAnd: TemperingMaskC).
	y := y bitXor: (y bitShift: 18 negated).
	^ y