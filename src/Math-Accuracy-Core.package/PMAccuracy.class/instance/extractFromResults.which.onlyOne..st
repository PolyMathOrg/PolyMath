private
extractFromResults: theResults which: num onlyOne: aBoolean
	| aResult |
	numberOfResults := aBoolean 
		ifTrue: [ aResult := theResults. nil ]
		ifFalse: [ aResult := theResults at: num.	num ].
	^ aResult