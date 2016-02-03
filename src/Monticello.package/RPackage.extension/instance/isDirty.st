*Monticello-RPackage
isDirty

	| modifiedPackages packages |
	modifiedPackages := MCWorkingCopy allManagers select: [ :each | each modified ].
	packages := modifiedPackages collect: [:each | each package name].
	^ packages includes: self name.