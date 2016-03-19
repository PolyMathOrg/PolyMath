showing
updateWindow
|oldTRMorph newCanvas|
window ifNil:[^self].
oldTRMorph :=window lastSubmorph. 
newCanvas :=aView canvas.
newCanvas camera: oldTRMorph trachelCanvas camera.
oldTRMorph trachelCanvas camera: nil."does not really help,it seems that oldTRMorph does not get garbage collected until window gets closed"
window replacePane: oldTRMorph with: newCanvas buildMorph.