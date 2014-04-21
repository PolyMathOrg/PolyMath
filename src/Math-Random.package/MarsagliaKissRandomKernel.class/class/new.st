instance creation
new
	| seedGenerator |
	seedGenerator := self seed: ((1 to: 4) collect: [:i | Time microsecondClockValue + i]).
	^self seed: (seedGenerator next: 4)