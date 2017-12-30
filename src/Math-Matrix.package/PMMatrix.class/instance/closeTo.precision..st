comparing
closeTo: aPMMatrix precision: aPrecision
	^ (self - aPMMatrix) abs sum sum < aPrecision