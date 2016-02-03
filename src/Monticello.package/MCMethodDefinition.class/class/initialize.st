initialization
initialize
	Smalltalk addToShutDownList: self.
	SessionManager default registerSystemClassNamed: self name