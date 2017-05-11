operation
inverse1By1
	"Private - Answer the inverse of the receiver when it is a 1x1 matrix (no check is made)."
	^ self class rows: ( PMVector with: ( PMVector with: ( 1/ ((rows at: 1) at: 1))))