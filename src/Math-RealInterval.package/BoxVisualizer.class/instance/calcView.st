private
calcView
self checkResult.
aView := RTView new @ RTDraggableView.
aView canvas color: backgroundColor .
aView addMenu: ' Print' callback: [ self print ].
aView addMenu: 'In' callback: [ RTZoomInMove on: aView].
aView addMenu: 'Out' callback: [ RTZoomOutMove on: aView].
self boxesIntoView .
^aView