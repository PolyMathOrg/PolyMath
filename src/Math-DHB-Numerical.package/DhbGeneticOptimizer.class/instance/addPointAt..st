transformation
addPointAt: aNumber 
	"necessary since nan's and infinites can throw off calculations. and calculations become a tiny bit more efficient"
	| p |
 	p:=optimizingPointClass vector: aNumber function: functionBlock.
 	((p value isInfinite)or:[p value isNaN]) ifFalse: [bestPoints add: p].