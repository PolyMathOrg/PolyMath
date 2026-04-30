Extension { #name : 'PMGeneralFunctionFit' }

{ #category : '*Math-UI' }
PMGeneralFunctionFit >> inspectorFunctionPlotTab: aBuilder [

    <inspectorPresentationOrder: 1 title: 'Function plot'>
    | plot |
    plot := RSLinePlot points: data.
    plot build.
    ^ (aBuilder instantiate: SpRoassalInspectorPresenter)
          canvas: plot canvas;
          yourself
]
