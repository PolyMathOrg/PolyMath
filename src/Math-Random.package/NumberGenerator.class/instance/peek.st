accessing
peek
	"really a subclass responsibility, this may be overriden whenever its more efficient to do so"
	^ (self copy generator: (self generator copy)) next