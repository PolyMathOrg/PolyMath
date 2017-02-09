[[[
| histogram valueStream |
	valueStream := #(3 3 5 6 7 7 7 72  1 3  5 7 8 20) readStream.
      histogram := PMHistogram new.
      [ valueStream atEnd ]
		whileFalse: [ histogram accumulate: valueStream next ].
histogram			
]]]