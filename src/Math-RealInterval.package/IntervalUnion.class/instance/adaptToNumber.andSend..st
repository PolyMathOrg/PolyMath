adapting
adaptToNumber: rcvr andSend: selector
"works also as adaptToRealInterval:andSend: , which does not exist"
selector = #= ifTrue:[^ self=rcvr ].
^self intervalCollect:[:i| rcvr perform: selector with: i]