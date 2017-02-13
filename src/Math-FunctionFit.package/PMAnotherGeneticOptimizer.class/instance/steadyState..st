accessing
steadyState: aBoolean
"if steadyState is false, the old method of making room for new individuals after one iteration and just keeping the best so far is used. If it is true (the default), then everything is kept and only offspring that are better than the worst so far are put into the population."
steadyState :=aBoolean .