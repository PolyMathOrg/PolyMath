private
growPositiveContents: anInteger
	"Private"

	| n newContents |
	n := contents size.
	newContents := Array new: anInteger.
	newContents
		replaceFrom: 1
		to: n
		with: contents
		startingAt: 1.
	n + 1 to: anInteger - 1 do: [ :i | newContents at: i put: 0 ].
	newContents at: anInteger put: 1.
	contents := newContents