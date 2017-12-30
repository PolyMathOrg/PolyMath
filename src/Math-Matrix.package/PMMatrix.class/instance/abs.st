arithmetic
abs
	"Computes the element-wise absolute value."
	^ self class rows: (rows collect: #abs).