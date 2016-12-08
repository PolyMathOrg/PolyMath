testing-arithmetic
testIEEEArithmeticVersusFloat
	| floats ops ref new |
	floats := #(1.0 2.0 3.0 5.0 10.0 2r1.0e52 2r1.0e53 2r1.0e54 0.5 0.25 2r1.0e-52 2r1.0e-53 2r1.0e-54 1.0e60 0.1 1.1e-30 1.0e-60) copyWith: Float pi.
	ops := #(#+ #- #* #/ #= #< #> ).
	ops
		do: [:op | floats
				do: [:f1 | floats
						do: [:f2 | 
							ref := f1 perform: op with: f2.
							new := (f1 asArbitraryPrecisionFloatNumBits: 53)
										perform: op
										with: (f2 asArbitraryPrecisionFloatNumBits: 53).
							self assert: new = ref]]]