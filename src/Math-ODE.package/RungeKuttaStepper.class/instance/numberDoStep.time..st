stepping
numberDoStep: aState time: t
	"state is a number. Take a single step at t."
	| k1 k2 k3 k4 |
	k1 := system x: aState t: t.
	k2 := system x: aState + (k1 * self stepSize / 2 ) t: self stepSize / 2 + t.
	k3 := system x: aState + (k2 * self stepSize / 2 ) t: self stepSize / 2 + t.
	k4 := system x: aState + (self stepSize * k3) t: self stepSize + t.
	^ aState + ((k1 + k2 + k2 + k3 + k3 + k4)/ 6 * self stepSize).