*Monticello-RPackage
initializeFromMCExtensionsFor: aBehavior protocol: aProtocol
	| package protocolName |
	
	protocolName := (aProtocol name allButFirst) trimBoth.
	package := self packageMatchingExtensionName: protocolName.
	package ifNil: [
		package := self basicRegisterPackage: (RPackage named: protocolName) ].
	self registerExtendingPackage: package forClass: aBehavior.
	(aProtocol methods 
		select: [ :eachSelector | (aBehavior >> eachSelector) origin = aBehavior ])
		do: [ :eachSelector | package addMethod: aBehavior >> eachSelector ]