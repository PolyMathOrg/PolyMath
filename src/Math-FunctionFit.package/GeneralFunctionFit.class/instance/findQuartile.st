operation
findQuartile
| errorCol d2 max v n|
(#(#quartile #insensitive) includes: self errorType ) ifFalse:
	[^ Error signal: 'errorType has to be set to #quartile or #insensitive' ].
dataTruncated ifTrue: [errorFunction data: data. dataTruncated :=false]. "necessary"
(data size - errorFunction parameterSize)<7 ifTrue: [^ Error signal: 'datasize to small'].
max:= 0.999.
v:=verbose .
verbose:=false.
n:=0.
[	self quartile: max.
	self evaluate.
	errorCol:= self errorCollection sort.
	d2:=(errorFunction parameterSize to: (errorCol size -4) ) collect: [:i| {i+2.
		(2*(errorCol at: i)) - (errorCol at: i+1) - (2*(errorCol at: i+2))- (errorCol at: i+3)+(2*(errorCol at: i+4))} ].
	[max :=#(5 0).
	d2 do: [:d|((d at: 2) >= (max at:2)) ifTrue: [max :=d]].
	(max first = (d2 last first))ifTrue: [
		(d2 size =1)ifTrue: [^ Error signal: 'findQuartile unsolvable'].
		d2 := (d2 copyFrom: 1 to:(d2 size  -1)).
		true ] ifFalse:[false] .] whileTrue.
	max :=(max first / errorCol size) .
	n:=n+1.
	((max <self quartile ) ifTrue: [true] ifFalse: [(max =self quartile)ifTrue: [false] ifFalse: [n<5] ])
		ifTrue: [v ifTrue: [self inform: 'found quartile: ' , max asString ].true] ifFalse:[false] .
 	] whileTrue.
verbose :=v.
^self evaluate 
