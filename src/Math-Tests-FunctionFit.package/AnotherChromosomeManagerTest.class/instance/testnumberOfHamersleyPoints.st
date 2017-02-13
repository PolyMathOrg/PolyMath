tests
testnumberOfHamersleyPoints
	| rand |
	self
		assert:
			(PMAnotherChromosomeManager
				numberOfHamersleyPoints: 9
				dimension: 1
				randomized: false)
		equals: ((1 to: 9) collect: [ :i | {(i * (1 / 9))} ]).
	self
		assert:
			(PMAnotherChromosomeManager
				numberOfHamersleyPoints: 9
				dimension: 4
				randomized: false)
		equals:
			{{(1 / 9).
			(1 / 2).
			(1 / 3).
			(1 / 5)}.
			{(2 / 9).
			(1 / 4).
			(2 / 3).
			(2 / 5)}.
			{(1 / 3).
			(3 / 4).
			(1 / 9).
			(3 / 5)}.
			{(4 / 9).
			(1 / 8).
			(4 / 9).
			(4 / 5)}.
			{(5 / 9).
			(5 / 8).
			(7 / 9).
			(1 / 25)}.
			{(2 / 3).
			(3 / 8).
			(2 / 9).
			(6 / 25)}.
			{(7 / 9).
			(7 / 8).
			(5 / 9).
			(11 / 25)}.
			{(8 / 9).
			(1 / 16).
			(8 / 9).
			(16 / 25)}.
			{1.
			(9 / 16).
			(1 / 27).
			(21 / 25)}}.
	rand := (PMAnotherChromosomeManager
		numberOfHamersleyPoints: 3
		dimension: 4
		randomized: false)
		-
			(PMAnotherChromosomeManager
				numberOfHamersleyPoints: 3
				dimension: 4
				randomized: true).
	rand
		do: [ :i | 
			self assert: i first >= 0.
			self assert: (i at: 2) < 0.
			self assert: (i at: 3) < 0 ].
	rand do: [ :i | i do: [ :j | j < (1 / 3) ] ]