A KernelSmoothedDensity estimates the probability density function from a sample drawn from some distribution with an unknown density.  you initialize it with: 
 k := KernelSmoothedDensity fromData: aCollectionOfSampleNumbers
and you get the estimated density value as usual with:  
k value: aValue
the kernels are settable via either #normal (the default) or #epanechnikov. 
the bandwidth can be set via  #bandWidth: or #ruleOfThumbBandWidth