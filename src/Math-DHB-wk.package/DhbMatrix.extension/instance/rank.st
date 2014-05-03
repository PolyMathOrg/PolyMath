*Math-DHB-wk
rank 
^((self numberOfRows < self numberOfColumns ifTrue: [self transpose ] ifFalse: [self ])  qrFactorizationWithPivoting at: 2)rows size 