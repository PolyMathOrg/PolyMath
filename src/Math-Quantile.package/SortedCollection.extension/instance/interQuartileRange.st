*Math-Quantile
interQuartileRange
"if I use my standard sortBlock, then this returns the usual interQuartileRange (IQR)"
^(self quantile:(3/4)method: 'hydrologist')-(self quantile:(1/4)method: 'hydrologist')