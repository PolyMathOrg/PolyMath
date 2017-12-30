accessing
messageText
	"Overwritten to initialize the message text to a standard text if it has not yet been set"
	^ messageText ifNil: [ messageText := self standardMessageText ]