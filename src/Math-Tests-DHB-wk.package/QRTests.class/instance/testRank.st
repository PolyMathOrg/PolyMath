tests
testRank
	| a i|
	i:=0.
	[a :=DhbMatrix rows: 5 columns: 7 random: 5.0 . 
	a rank=5 ifTrue:
		[a atRow: 2 put:((a rowAt: 1) + (3.0 random * (a rowAt: 3)) ). 
		a atRow: 4 put:( ((0.5+3.0 random)* (a rowAt: 5)) ). 
		i:=i+1.
		self assert: (a rank=3).
		self assert: (a transpose rank=3)].
	i<10]whileTrue .