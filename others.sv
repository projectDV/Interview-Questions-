1. Did you serviced the interrupt ?
-yes! with the help of error injection tests. usually error interrupts get generated inside a submodule on  a certaint pin which is further clustered with a bigger module which can be a port of single pin. Now once interrupt is high it is masked using test such that when it comes to the single pin port where TB read the value it comes as low [0], which will hence service my interuppt.
0|0|0|1|0|0|0|0 //actual interrupt in submodule 
0|0|0|0|0|0|0|0 //masking with bitwise AND
  0               // at level sinlge pin [i.e. interrupt is serviced]
  
  
