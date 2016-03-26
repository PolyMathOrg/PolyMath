transformation
transformAt: anInteger1 and: anInteger2
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "
	| d t s c tau apq app aqq arp arq |
	apq := ( lowerRows at: anInteger2) at: anInteger1.
	apq = 0
		ifTrue: [ ^nil].
	app := ( lowerRows at: anInteger1) at: anInteger1.
	aqq := ( lowerRows at: anInteger2) at: anInteger2.
	d := aqq - app.
	arp := d * 0.5 / apq.
	t := arp > 0 ifTrue: [ 1 / ( ( arp squared + 1) sqrt + arp)]
				 ifFalse:[ 1 / ( arp - ( arp squared + 1) sqrt)].
	c := 1 / ( t squared + 1) sqrt.
	s := t * c.
	tau := s / ( 1 + c).
	1 to: ( anInteger1 - 1)
		do: [ :r |
			  arp := ( lowerRows at: anInteger1) at: r.
			  arq := ( lowerRows at: anInteger2) at: r.
			  ( lowerRows at: anInteger1) at: r put: ( arp - ( s * (tau * arp + arq))).
			  ( lowerRows at: anInteger2) at: r put: ( arq + ( s * (arp - (tau * arq)))).
			].
	( anInteger1 + 1) to: ( anInteger2 - 1)
		do: [ :r |
			  arp := ( lowerRows at: r) at: anInteger1.
			  arq := ( lowerRows at: anInteger2) at: r.
			  ( lowerRows at: r) at: anInteger1 put: ( arp - ( s * (tau * arp + arq))).
			  ( lowerRows at: anInteger2) at: r put: ( arq + ( s * (arp - (tau * arq)))).
			].
	( anInteger2 + 1) to: lowerRows size
		do: [ :r |
			  arp := ( lowerRows at: r) at: anInteger1.
			  arq := ( lowerRows at: r) at: anInteger2.
			  ( lowerRows at: r) at: anInteger1 put: ( arp - ( s * (tau * arp + arq))).
			  ( lowerRows at: r) at: anInteger2 put: ( arq + ( s * (arp - (tau * arq)))).
			].
	1 to: lowerRows size
		do: [ :r |
			  arp := ( transform at: r) at: anInteger1.
			  arq := ( transform at: r) at: anInteger2.
			  ( transform at: r) at: anInteger1 put: ( arp - ( s * (tau * arp + arq))).
			  ( transform at: r) at: anInteger2 put: ( arq + ( s * (arp - (tau * arq)))).
			].
	( lowerRows at: anInteger1) at: anInteger1 put: ( app - (t * apq)).
	( lowerRows at: anInteger2) at: anInteger2 put: ( aqq + (t * apq)).
	( lowerRows at: anInteger2) at: anInteger1 put: 0.