"
A KernelSmoothedDensity estimates the probability density function from a sample drawn from some distribution with an unknown density.  you initialize it with: 
 k := KernelSmoothedDensity fromData: aCollectionOfSampleNumbers
and you get the estimated density value as usual with:  
k value: aValue
the kernels are settable via either #normal (the default) or #epanechnikov. 
the bandwidth can be set via  #bandWidth: or #ruleOfThumbBandWidth
"
Class {
	#name : #PMKernelSmoothedDensity,
	#superclass : #PMProbabilityDensity,
	#instVars : [
		'data',
		'kernel',
		'bandwidth',
		'kernelName',
		'ikernel'
	],
	#category : #'Math-Distributions-KernelSmoothing'
}

{ #category : #information }
PMKernelSmoothedDensity class >> distributionName [
	^'KernelSmoothedDistribution'
]

{ #category : #'instance creation' }
PMKernelSmoothedDensity class >> fromData: aCollectionOfNumbers [
|result|
result := self new.
result  data: aCollectionOfNumbers; normal; ruleOfThumbBandWidth.
^result  
]

{ #category : #information }
PMKernelSmoothedDensity >> average [
^data average
]

{ #category : #accessing }
PMKernelSmoothedDensity >> bandWidth [

^bandwidth
]

{ #category : #accessing }
PMKernelSmoothedDensity >> bandWidth: aNumber [

^bandwidth := aNumber 
]

{ #category : #transformation }
PMKernelSmoothedDensity >> changeParametersBy: aVector [ 
	^self shouldNotImplement .
]

{ #category : #accessing }
PMKernelSmoothedDensity >> data [
^data
]

{ #category : #accessing }
PMKernelSmoothedDensity >> data: aCollectionOfNumbers [
	"sample data"
^data := SortedCollection withAll: aCollectionOfNumbers .
]

{ #category : #information }
PMKernelSmoothedDensity >> distributionValue: aNumber [
^(data collect:[:x|
			ikernel value: (aNumber - x / bandwidth) ])sum / data size 
]

{ #category : #accessing }
PMKernelSmoothedDensity >> epanechnikov [
kernelName:= #epanechnikov.
ikernel:=[:x|x < 5 sqrt negated  ifTrue:[0]ifFalse:[x > 5 sqrt ifTrue:[1]ifFalse:[(x - ((x raisedToInteger: 3) / 15)) * (3/(4* 5 sqrt))+(1/2)]]].
^kernel := [:x|x abs >= 5 sqrt ifTrue:[0]ifFalse: [1 - (x squared /5) * (3/(4* 5 sqrt))]].

]

{ #category : #accessing }
PMKernelSmoothedDensity >> iKernel: aBlock [
"the integral of the kernel, necessary to set for '#distributionValue:' if you set '#kernel:'."
^ikernel := aBlock 

]

{ #category : #accessing }
PMKernelSmoothedDensity >> kernel [
^kernel

]

{ #category : #accessing }
PMKernelSmoothedDensity >> kernel: aBlock [
"set also ikernel by hand"
kernelName:= 'unknown'.
^kernel := aBlock 

]

{ #category : #accessing }
PMKernelSmoothedDensity >> normal [
kernelName :='normal'.
ikernel:=[:x|PMErfApproximation new value:x].
^kernel:=[:x|(x squared / -2.0)exp / Float twoPi sqrt].

]

{ #category : #information }
PMKernelSmoothedDensity >> parameters [
^nil
]

{ #category : #printing }
PMKernelSmoothedDensity >> printOn: aStream [
   aStream nextPutAll: self class distributionName.
	aStream nextPutAll:  ' (dataSize: ';
	 print: (data isCollection ifTrue:[data size]ifFalse:[0]) ;
	 nextPutAll:  ' kernel: ';
	 print: (kernelName='unknown' ifTrue:[kernel]ifFalse: [kernelName]);
	 nextPutAll: ' bandWidth: ';
	 print: bandwidth ;
	 nextPut: $) .
]

{ #category : #accessing }
PMKernelSmoothedDensity >> ruleOfThumbBandWidth [
	"Silverman's Rule of Thumb, assumes that the distribution is similar to a normal distribution"
	|s|
	s:=data stdev min: (data interQuartileRange / 1.34).
	^bandwidth := 0.9 * s * (data size raisedTo: (-0.2))
]

{ #category : #evaluating }
PMKernelSmoothedDensity >> value: aNumber [
	"smoothed result"
^(data collect:[:x|
			kernel value: (aNumber - x / bandwidth)])sum / (data size * bandwidth) 

]

{ #category : #information }
PMKernelSmoothedDensity >> variance [ 
^data stdev squared + bandwidth squared
]
