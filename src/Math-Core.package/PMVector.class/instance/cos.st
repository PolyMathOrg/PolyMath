operation
cos
	"Apply cos function to every element of a vector"
	1 to: self size do: [ :n | self at: n put: (self at: n) cos].