printing
standardMessageText
	^ String streamContents: [ :stream |
		stream << (self signalerContext  asString findTokens: '>')last.
		stream << ' encountered a singular matrix']