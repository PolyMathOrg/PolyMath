private
privateInverseDistributionValue: aNumber
	"Private - Answer the number whose distribution is aNumber.
	NOTE: Subclass may overwrite this method for faster computation."
	^( PMCDFNewtonZeroFinder function: [ :x | ( self distributionValue: x) - aNumber] derivative: self)
		initialValue: self average ; evaluate