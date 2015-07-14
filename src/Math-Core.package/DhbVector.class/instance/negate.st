transformation
negate
	"Inverse the sign of all components of the receiver."
	1 to: self size do: [ :n | self at: n put: (self at: n) negated].