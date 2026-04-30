Extension { #name : 'PMErrorOfParameterFunction' }

{ #category : '*Math-UI' }
PMErrorOfParameterFunction >> inspectorFunctionPlotTab: aBuilder [

    <inspectorPresentationOrder: 1 title: 'Error function plot'>
    ^ (PMFunctionPlotter onData: data) buildPlotPresenter: aBuilder
]

{ #category : '*Math-UI' }
PMErrorOfParameterFunction >> inspectorTable: aBuilder [

    <inspectorPresentationOrder: 2 title: 'Error function parameters'>

    ^ PMTablePresenterInspectorBuilder new
        tableItems: self inspectorTableParametersItems;
        buildTable: aBuilder
]

{ #category : '*Math-UI' }
PMErrorOfParameterFunction >> inspectorTableParametersItems [

    | items |
    items := {
                 ('Function' -> (PMFunctionPrinter new printFunction: function)).
                 ('RelativeError' -> relative).
                 ('Error type' -> errorType) }.
    items := items collect: [ :e | StInspectorAssociationNode hostObject: e ].
    (#( #quartile #insensitive ) includes: errorType) ifTrue: [
        items add: (StInspectorAssociationNode hostObject: 'With quartile' -> quartile) ].
    ^ items
]
