private
boxesIntoView
|box|
box:=RTBox new 
		borderColor:(withBorder 
			ifTrue: [Color darkGray]
			ifFalse:[color]) ;
		color: color.
self calcUsedResult .
usedResult do: [ :r | |x|
	x:= box elementOn: r . 
	x trachelShape 
		from: (r first inf @ r second inf negated) * zoomFactor 
		to: (r first sup @ r second sup negated) * zoomFactor . 
	aView add:x].
aView elements do: [ :e | e @ (RTPopup text: [:el | el ])].
