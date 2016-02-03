*Monticello-RPackage
basicInitializeFromMC
	self allManagers
		do: [ :workingCopy | self basicRegisterPackage: (RPackage named: workingCopy packageName) ]
		displayingProgress: 'Importing monticello packages'.
		
	Smalltalk allClassesAndTraits 
		do: [ :eachBehavior | self initializeFromMCFor: eachBehavior ]
		displayingProgress: 'Importing behaviors'.

	Smalltalk allClassesAndTraits 
		do: [ :eachBehavior | 
			self initializeFromMCMethodsFor: eachBehavior.
			self initializeFromMCMethodsFor: eachBehavior class ]
		displayingProgress: 'Importing methods'.

	Smalltalk allClassesAndTraits 
		do: [ :eachBehavior |
			eachBehavior organization extensionProtocols do: [ :eachProtocol | 
				self 
					initializeFromMCExtensionsFor: eachBehavior 
					protocol: eachProtocol ].
			eachBehavior class organization extensionProtocols do: [ :eachProtocol | 
				self 
					initializeFromMCExtensionsFor: eachBehavior class 
					protocol: eachProtocol ] ]
		displayingProgress: 'Importing extensions'.
