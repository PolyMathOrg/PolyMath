comparing
closeTo: aPMVector precision: aPrecision
	"Tests whether the total summed difference between self and aPMVector is within aPrecision."

	^ (self - aPMVector) abs sum < aPrecision