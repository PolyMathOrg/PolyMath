initialize-release
initialize
	super initialize.
	announcers := IdentitySet new.
	block := self defaultBlock.
	^ self