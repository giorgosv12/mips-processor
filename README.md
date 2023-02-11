# MIPS Processor using Verilog
***

The goal of this project was to create a multi-cycle 32 bits processor using Verilog hardware description language. The 
processor comprises two main components: the **Control Unit** and the **Datapath**. The Control Unit is implemented as 
a finite state machine that determines the flow of operations within the processor. The Datapath, on the other hand, encompasses 
the following stages:

- Instruction Recall Stage (**IF**)
- Command Decoding Stage (**Decode**)
- Instruction Execution Unit (**ALU**)
- Memory Access Level (**Mem**)

In the Instruction Recall Stage (IF), the processor retrieves the instruction from memory and prepares it for further 
processing. This stage is responsible for fetching the instruction and making it available to the next stage of the pipeline.

The Command Decoding Stage (Decode) takes the instruction retrieved in the previous stage and decodes it to determine 
what operation needs to be performed. This stage is crucial as it generates the necessary signals for the Instruction 
Execution Unit (ALU) to perform the operation.

The Instruction Execution Unit (ALU) performs the actual operation specified by the instruction. This stage is 
responsible for executing the arithmetic and logical operations specified by the instruction.

Finally, the Memory Access Level (Mem) accesses the memory to either read or write data. This stage is 
responsible for reading data from memory and writing the results of the ALU operations back to memory.

More details about the processor can be found in the provided [Report](mipsProcessor.pdf).

## Overview
***
The necessary files for the recreation of the MIPS Processor are located inside [processorFiles](processorFiles) folder
which also contains the testbench files for some modules. This processor was developed for **Hardware I** course 
and is part of a team project (co-creator: [Giaki Dimitra](https://github.com/dimigiak)).
The requirements for the processor can be found inside [processorRequirements](processorRequirements) folder (Greek). 
