accessing
maxWidthDimension
|d max m|
max := 0.
d := 1 min: self size.
1 to: self size do: [ :i|
	m:= (self at:i) width.
	m > max ifTrue: [max:=m. d:=i]].
^d