"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMathMatrix,
	#superclass : #PackageManifest,
	#category : 'Math-Matrix'
}

{ #category : #'code-critics' }
ManifestMathMatrix class >> ruleRBInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PMMatrix #tr #false)) #'2017-02-11T12:20:26.44992+02:00') )
]

{ #category : #'code-critics' }
ManifestMathMatrix class >> ruleRBRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PMMatrix)) #'2017-02-10T16:21:29.311293+02:00') )
]

{ #category : #'code-critics' }
ManifestMathMatrix class >> ruleRBSelfSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PMMatrix)) #'2017-02-11T12:20:10.550284+02:00') )
]
