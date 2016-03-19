instance creation
newFrom: aCollectionOfConstraintsOrConstraint
	^ aCollectionOfConstraintsOrConstraint isCollection 
		ifTrue: [ super newFrom: aCollectionOfConstraintsOrConstraint ] 
		ifFalse: [ ConstraintsCollection with: aCollectionOfConstraintsOrConstraint ]
