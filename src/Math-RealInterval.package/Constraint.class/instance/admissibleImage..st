accessing
admissibleImage: possibleValues
"possibleValues needs to understand #includes: and #intersection: for the tests (see protocol testing) to work, hence RealIntervals and IntervalUnions are possible, but not Numbers! for Numbers use #equalToNumber:"
	^admissibleImage := possibleValues