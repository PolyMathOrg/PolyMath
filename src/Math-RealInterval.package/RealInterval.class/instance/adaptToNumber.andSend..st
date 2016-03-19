double dispatching
adaptToNumber: rcvr andSend: selector
(rcvr isInfinite and: [ #(#max: #min:) includes: selector]) ifTrue: [ ^self perform: selector with: rcvr  ].
^(self class inf: rcvr sup: rcvr) perform: selector with: self