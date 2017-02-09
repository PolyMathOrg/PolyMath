running
setUp
h:=PMHistogram new.
h freeExtent: true.
1to:3 do: [:i |h accumulate: i].