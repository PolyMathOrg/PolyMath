development support
createNewDevelopmentVersion
	"Create a new development version using the #stable version as model."

	"self createNewDevelopmentVersion"

	<apiDocumentation>
	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) createNewDevelopmentVersionIn: self description: ''