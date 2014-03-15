IS2WiX
======

IS2WiX (Installshield to WiX) is a utility tool written in XSLT in order to convert Installshield projects (.ism) 
into WiX xml (done table by table). The output shall be re-organized into different files. Be warned that the output
is not perfect and you must make proper adjustment.

Some tables are written in heavy recursive calls. MS VS may not support that and throws stack overflow exception. So
turn to other XSLT transltor tool or browser-based tool like:

http://www.purplegene.com/static/transform.html

I hope you find this tool can save sometime.
