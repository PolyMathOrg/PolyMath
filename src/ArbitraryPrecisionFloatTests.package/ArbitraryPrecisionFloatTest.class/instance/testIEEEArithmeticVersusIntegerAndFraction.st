testing-arithmetic
testIEEEArithmeticVersusIntegerAndFraction
	"check that results are the same as IEEE 754 accelerated hardware
	WARNING: this cannot be the case for denormalized numbers (gradual underflow)
	because our exponent is unlimited"

	| floats ops ref new intAndFractions |
	floats := #(1.0e0 2.0e0 3.0e0 5.0e0 10.0e0) 
				, (#(52 53 54 -52 -53 -54) collect: [:e | 1.0e0 timesTwoPower: e]) 
					, #(0.5e0 0.25e0 1.0e60 0.1e0 1.1e-30 1.0e-60) copyWith: Float pi.
	intAndFractions := #(1 3 5 10 12345678901234567890 -1 -22 -3 1.2s1) copyWith: 7/9.
	intAndFractions := intAndFractions , (intAndFractions collect: [:e | e reciprocal]).
	
	ops := 1/10 = 0.1
		ifTrue: [#(#+ #- #* #/)]
		ifFalse: [#(#+ #- #* #/ #= #< #>)]. "BEWARE: ArbitraryPrecisionFloat compare exactly, Float don't, unless http://bugs.squeak.org/view.php?id=3374"
	ops do: 
			[:op | 
			floats do: 
					[:f1 | 
					intAndFractions do: 
							[:f2 | 
							ref := f1 perform: op with: f2 asFloat.
							new := (f1 asArbitraryPrecisionFloatNumBits: 53) perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref.
							new := f1 perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref.
							
							ref := f1 perform: op with: f2.
							new := (f1 asArbitraryPrecisionFloatNumBits: 53) perform: op
										with: f2.
							self assert: new = ref.
							
							ref := f2 asFloat perform: op with: f1.
							new := (f2 asArbitraryPrecisionFloatNumBits: 53) perform: op
										with: (f1 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref.
							new := (f2 asArbitraryPrecisionFloatNumBits: 53) perform: op with: f1.
							self assert: new = ref.
							
							ref := f2 perform: op with: f1.
							new := f2 perform: op
										with: (f1 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref]]]