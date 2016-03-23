development support
saveConfiguration: commitMessage
	"Save mcz file that contains the configuration to it's repository."

	"self saveConfiguration: '- fixed bug'"

	<apiDocumentation>
	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) saveConfigurationPackageFor: self name asString description: commitMessage