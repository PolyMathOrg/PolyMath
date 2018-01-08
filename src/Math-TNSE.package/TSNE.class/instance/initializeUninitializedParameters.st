initialization
initializeUninitializedParameters
	perplexity ifNil: [ perplexity := self perplexityDefaultValue ].
	ndims ifNil: [ ndims := self ndimsDefaultValue ]