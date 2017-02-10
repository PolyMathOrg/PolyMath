printing
unfinishedInfo
verbose ifFalse: [ ^self ].
GrowlMorph 
			openWithLabel: 'Warning' 
			contents: ('maximumIterations ({1}) reached.
you can run evaluate a second time' format: {maximumIterations}) 
			color: Color orange darker