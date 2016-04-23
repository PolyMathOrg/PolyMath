stream access
next
	"Generator based on multiplication of uniform random variable. Luc DeVroye, Non-Uniform Random Variate Generation, Section X.3"

	| x prod limit |
	limit := self lambda negated exp.
	x := 0.
	prod := 1.
	[ true ]
		whileTrue:
			[ | u |
			u := self generator next.
			prod := u * prod.
			prod > limit
				ifTrue: [ x := x + 1 ]
				ifFalse: [ ^ x ] ]