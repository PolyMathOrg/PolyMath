transformation
cumsum
	"Compute cumulative sum of the vector"
	2 to: self size do: [ :n | self at: n put: (self at: n) + (self at: n - 1)].