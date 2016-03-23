development support
updateToLatestPackageVersions: descriptionString
	"Update the #development version to match currently loaded mcz files."

	"self updateToLatestPackageVersions: '- fixed a bug'"

	<apiDocumentation>
	self ensureMetacello.
	((Smalltalk at: #MetacelloToolBox) updateToLatestPackageVersionsIn: self description: descriptionString) isEmpty
		ifTrue: [ self inform: 'All specs up to date' ]