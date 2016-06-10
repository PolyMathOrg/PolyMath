A DhbDecimalFloatingNumber is a demonstration of floating point arithmetic and rounding errors. The implementation uses decimal digits to allow easier human reading and understanding, and hand-worked examples. Only basic arithmetic operations are specified (+, -,*, sqrt). 

The message #value answers a fraction which is the exact representation of the stored number. 

The message #normalize uses truncation to fit the best precision possible. It is at this step that roundoff errors occur. #normalize is called when these numbers are created.

This class is detailed in appendix A of Didier Besset's book.