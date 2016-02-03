visiting
visitMethodDefinition: definition
	self writeMethodPreamble: definition.
	self writeMethodSource: definition.
	self writeMethodPostscript.
	self writeMethodInitializer: definition.