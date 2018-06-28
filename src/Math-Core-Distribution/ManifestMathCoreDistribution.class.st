"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMathCoreDistribution,
	#superclass : #PackageManifest,
	#category : 'Math-Core-Distribution'
}

{ #category : #'code-critics' }
ManifestMathCoreDistribution class >> ruleRBCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'DhbProbabilityDensity class' #fromHistogram: #true)) #'2016-03-02T09:06:24.499812+01:00') )
]
