as yet unclassified
mpInverse
	"Moore Penrose Inverse. "
	|f g|
	self numberOfRows < self numberOfColumns 
		ifTrue:[	f := self transpose qrFactorizationWithPivoting. 
					g := f first.
					f := f second inversePivotColumns: (f at:3) ]
		ifFalse: [ f := self qrFactorizationWithPivoting. 
					g := (f second  inversePivotColumns: (f at:3)) transpose.
					f := f first transpose ]. 
	^ g * ((f *self *g) inverse) *f