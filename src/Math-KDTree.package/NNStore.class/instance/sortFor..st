sorting
sortFor: whatever
"should be overwritten by subclasses"

"self do:[:e|e at: 1 put: somethingDependingOnWhatever ]."
self sort .