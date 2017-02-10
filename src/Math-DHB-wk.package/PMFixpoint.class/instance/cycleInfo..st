printing
cycleInfo: cycleLength
verbose ifFalse: [ ^self ].
GrowlMorph 
			openWithLabel: 'Info'
			contents: ('{1} iterations used.
warning: {2}-cycle detected' format: {iterations. cycleLength})
			color: Color gray muchDarker