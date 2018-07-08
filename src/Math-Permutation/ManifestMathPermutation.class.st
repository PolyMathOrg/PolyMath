"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMathPermutation,
	#superclass : #PackageManifest,
	#category : #'Math-Permutation'
}

{ #category : #'code-critics' }
ManifestMathPermutation class >> ruleRBCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Permutation class' #generator: #true)) #'2018-07-07T11:52:50.239421+02:00') )
]

{ #category : #'code-critics' }
ManifestMathPermutation class >> ruleRBModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Permutation class' #generator: #true)) #'2018-07-07T11:52:46.085547+02:00') )
]

{ #category : #'code-critics' }
ManifestMathPermutation class >> ruleRBSendsDifferentSuperRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'Permutation class' #PMPermutation)) #'2018-07-07T11:53:26.042043+02:00') )
]

{ #category : #'code-critics' }
ManifestMathPermutation class >> ruleRBSuperSendsRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'Permutation class' #PMPermutation)) #'2018-07-07T11:53:19.542428+02:00') )
]

{ #category : #'code-critics' }
ManifestMathPermutation class >> ruleRBTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Permutation class' #stirling1:over: #true)) #'2018-07-07T11:54:16.87423+02:00') )
]

{ #category : #'code-critics' }
ManifestMathPermutation class >> ruleRBToDoRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'Permutation class' #PMPermutation)) #'2018-07-07T11:54:04.307575+02:00') )
]
