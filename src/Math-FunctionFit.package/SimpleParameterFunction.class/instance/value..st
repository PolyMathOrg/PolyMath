evaluating
value: aNumber
varArray at:1 put: aNumber .
^[function valueWithArguments: varArray ]on: Error do: [ Float nan ]