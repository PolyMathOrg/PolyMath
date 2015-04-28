printing
simpleInfo
verbose ifFalse: [ ^self ].
GrowlMorph 
			openWithLabel: 'Info' 
			contents: ('{1} iterations needed.' format: {iterations}) 
			color: Color green muchDarker