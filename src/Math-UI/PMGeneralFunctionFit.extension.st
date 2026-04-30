Extension { #name : 'PMGeneralFunctionFit' }

{ #category : '*Math-UI' }
PMGeneralFunctionFit >> inspectorFunctionPlotTab: aBuilder [

    <inspectorPresentationOrder: 1 title: 'Function plot'>
    ^ (PMFunctionPlotter onData: data) buildPlotPresenter: aBuilder
]

{ #category : '*Math-UI' }
PMGeneralFunctionFit >> inspectorTable: aBuilder [

    <inspectorPresentationOrder: 2 title: 'Function parameters'>

    ^ PMTablePresenterInspectorBuilder new
        tableItems: self inspectorTableParametersItems;
        buildTable: aBuilder
]

{ #category : '*Math-UI' }
PMGeneralFunctionFit >> inspectorTableParametersItems [

    | items |
    items := {
                 ('Generic optimizer' -> geneticOptimizer).
                 ('Data' -> data) }.
    items := items collect: [ :e | StInspectorAssociationNode hostObject: e ].
    dataTruncated ifTrue: [
            items add: (StInspectorAssociationNode hostObject: 'Truncated to' -> geneticOptimizer functionBlock data size) ].
    ^ items
]
