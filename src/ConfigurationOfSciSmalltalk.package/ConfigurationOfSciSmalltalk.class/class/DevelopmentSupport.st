development support
DevelopmentSupport

"if i want to make a new developmentversion, i do this:
1. i decomment the _versionstring:''_ things in the projects in the used baseline.
2. i run something like this to make eg version08:
MetacelloToolBox createDevelopment: '0.8' for: 'ConfigurationOfSciSmalltalk' importFromBaseline: '0.4-baseline' description:'blah'.
3. this is important or bleedingEdge wont function correctly: i put the decommented versionstring things again in comments."
	<apiDocumentation>
