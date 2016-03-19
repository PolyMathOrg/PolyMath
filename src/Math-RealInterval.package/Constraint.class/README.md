A Constraint consists of a block with one (!) argument (which can be a SequenceableCollection of several variables , eg an IntervalBox) and of the admissible results of that block. the admissible results can by set via #min:, #max:, #equalToNumber:  or #admissibleImage: 
(for the methods in the protocol testing to work the admissibleImage needs to understand only #includes: and #intersection:, hence this could also be used for non-numerical constraints)
examples:
c:=Constraint block: [ :x | x - x squared ] . "--> a Constraint([ :x | x - x squared ] <= 0)"
c max:3.
c. "--> a Constraint([ :x | x - x squared ] <= 3) "
c min:3.
c. "--> a Constraint(3 <=[ :x |  x - x squared ])" 
c equalToNumber: 3.
c. "--> a Constraint([ :x | x - x squared ] = 3)" 
c admissibleImage: (RealInterval inf: 0 sup: 3).
c. "--> a Constraint(0 <= [ :x | x - x squared ] <= 3)"    
