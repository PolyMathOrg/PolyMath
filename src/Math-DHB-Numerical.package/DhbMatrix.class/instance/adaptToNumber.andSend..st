double dispatching
adaptToNumber: rcvr andSend: selector
	"selector must obviously be commutative for this simple solution, but at the moment its only used for multiplication"
	^ self perform:  selector with: rcvr.