initialize-release
initialize
	super initialize.
	announcer := ExplicitAnnouncer new.
	^ self