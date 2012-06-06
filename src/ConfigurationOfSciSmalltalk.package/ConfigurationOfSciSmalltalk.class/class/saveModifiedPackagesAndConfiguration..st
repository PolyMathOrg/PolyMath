development support
saveModifiedPackagesAndConfiguration: commitMessage
	"Save modified mcz files, update the #development version and then save the configuration."

	"self saveModifiedPackagesAndConfiguration: '- fixed bug'"

	<apiDocumentation>
	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) saveModifiedPackagesAndConfigurationIn: self description: commitMessage