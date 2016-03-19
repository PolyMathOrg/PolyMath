private
calcBuilder
|aBuilder|
self checkResult.
aBuilder := ShapesWithAxisBuilder new.
self calcView .
aBuilder view: aView.
aBuilder objects: aView elements . 
aBuilder margin: 6.
aBuilder yAxisConfiguration labelConversion:
	[:i|(i/zoomFactor) asFloat round: decimals ];title:('dim:',dimensions second asString).
aBuilder xAxisConfiguration labelConversion:
	[:i|(i/zoomFactor) asFloat round: decimals];titlePosition: -35@0; title:('dim:',dimensions first asString).
^aBuilder build.