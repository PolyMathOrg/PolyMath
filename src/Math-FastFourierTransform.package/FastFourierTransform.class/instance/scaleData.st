private
scaleData
	| temp |
	temp := n sqrt.
	data := data collect: [ :j | PMComplex real: j real / temp imaginary: j imaginary / temp ]	"minimizes floating point error this way"