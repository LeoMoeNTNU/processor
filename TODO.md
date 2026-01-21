### Fix output in such a way that I can both upload to the FPGA and do tests. 
Outputting all the registers doesnt work. 
Ecall and the other of the last two instructions need to be implemented. 


### The PC address is probably not correct anymore after I swapped branch. This should be quick to fix because I've already done it (:-)
There will probably be a downshift by 2 on everything. 
Write some tests and fix. 

### I should probably fix some bit shifting and sign extensions to make jalr and jal works as they should.
This'll happen in the future (:-)

### Some of the ALU instructions are probably incorrect. Specifically some of the imm's may be potentially negative and I should make logic for it. 
I can fix a lot of this by sign extending potentially. 