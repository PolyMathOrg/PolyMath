private
calcZoomFactor
|ymin ymax d|
ymin:=Float infinity .
ymax:=ymin negated. 
usedResult do: [ :box| |i| 
	i:=box second. 
	ymin := ymin min: i inf.
	ymax := ymax max: i sup].
d:=ymax-ymin.
decimals:= (2-(d floorLog: 10)).
^zoomFactor :=(270/d)floor.