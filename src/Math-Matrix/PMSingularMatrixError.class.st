"
some calculations dont work with singular matrices and result eg with errors like 'receiver of last is nil', deep down in the calculation, which is quite ununderstandable. otoh these errors can occasionally be treated by using another calculation, hence i introduced this error.

"
Class {
	#name : #PMSingularMatrixError,
	#superclass : #ArithmeticError,
	#category : #'Math-Matrix'
}

{ #category : #accessing }
PMSingularMatrixError >> messageText [
	"Overwritten to initialize the message text to a standard text if it has not yet been set"
	^ messageText ifNil: [ messageText := self standardMessageText ]
]

{ #category : #printing }
PMSingularMatrixError >> standardMessageText [
	^ String streamContents: [ :stream |
		stream << (self signalerContext  asString findTokens: '>')last.
		stream << ' encountered a singular matrix']
]
