Class {
	#name : 'PMTablePresenterInspectorBuilder',
	#superclass : 'Object',
	#instVars : [
		'tableAssociationItems'
	],
	#category : 'Math-UI',
	#package : 'Math-UI'
}

{ #category : 'as yet unclassified' }
PMTablePresenterInspectorBuilder >> buildTable: aBuilder [

	 | tablePresenter |
    tablePresenter := aBuilder newTable.
    tablePresenter
        addColumn: (SpStringTableColumn title: 'Name' evaluated: #key);
        addColumn: (SpStringTableColumn title: 'Value' evaluated: #value);
        items: tableAssociationItems;
        beResizable.
    ^ tablePresenter
]

{ #category : 'as yet unclassified' }
PMTablePresenterInspectorBuilder >> tableItems: aCollection [

    tableAssociationItems := aCollection
]
