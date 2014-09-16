operation
truncateData
|ec ei |
dataTruncated ifTrue: [^Error signal:'data is already truncated'].
ec:=self errorCollection .
ei:=(ec withIndexCollect: [:e :i|{e.i}]).
ei:=(ei sort:[:a :b|a first<b first]) collect: [:e|e second ].
ei :=ei copyFrom: 1 to: (self quartile * ec size) truncated.
self resetResult.
dataTruncated:=true.
^self optimizer functionBlock data: (ei collect: [:i|self optimizer functionBlock data at: i]).
