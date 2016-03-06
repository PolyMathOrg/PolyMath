tests
testEigenvalues

	| actual expected analyser |
	analyser := SciPrincipleComponentAnalyser new: 5.
	100 timesRepeat: [ analyser accumulate: server next ].
	
	actual := analyser components.
	expected := #(3.623277676214216e7 766.1878578405343 -8.608930577556605e-13 2.1213150252733508e-13 -1.9556315119125588e-13) asDhbVector.
	(actual - expected) allButFirst allButFirst do: [ :each | self assert: each < 10e-8 ]
	
