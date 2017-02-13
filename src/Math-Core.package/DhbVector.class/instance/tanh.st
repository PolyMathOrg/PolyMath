operation
tanh
	"Apply tanh function to every element of a vector"
	1 to: self size do: [ :n | self at: n put: (self at: n) tanh].