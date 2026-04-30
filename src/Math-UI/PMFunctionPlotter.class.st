Class {
	#name : 'PMFunctionPlotter',
	#superclass : 'Object',
	#instVars : [
		'data'
	],
	#category : 'Math-UI',
	#package : 'Math-UI'
}

{ #category : 'as yet unclassified' }
PMFunctionPlotter class >> onData: aCollection [ 

	^ self new
		data: aCollection;
		yourself
]

{ #category : 'as yet unclassified' }
PMFunctionPlotter >> buildPlotPresenter: aBuilder [

    | plot |
    plot := RSLinePlot points: data.
    plot build.
    ^ (aBuilder instantiate: SpRoassalInspectorPresenter)
          canvas: plot canvas;
          yourself
]

{ #category : 'accessing' }
PMFunctionPlotter >> data: aCollection [

    data := aCollection
]
