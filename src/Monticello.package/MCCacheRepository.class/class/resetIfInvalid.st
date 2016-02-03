private
resetIfInvalid
	"Reset if invalid"

	default notNil and: [default directory exists ifFalse: [default := nil]]