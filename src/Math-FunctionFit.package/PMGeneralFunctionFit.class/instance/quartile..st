accessing
quartile: aFloat
"quartile: is used by errortypes #quartile and #insensitive. if you set quartile to 1, it does not make much sense to use #insensitive, since #insensitive is much slower than #quartile and calculating the tube radius is not quite correct for #insensitive in this special case (it will leave out one datapoint )."
self resetResult.
^errorFunction quartile: aFloat.