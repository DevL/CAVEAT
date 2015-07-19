# CAVEAT

## Machine concepts

* Central Unit
  * Decodes and dispatches instructions
* Registers
  * 16 32-bit general purpose registers
  * Separate program counter? 32-bit special register
* Load/Store architecture
* Instruction set
  * RISC
  * Fixed instruction length: 32-bit
  * Instructions can be handled by separate nodes
  * Instructions can be overloaded
  * Instruction format: 8-bit opcode, 24-bit operand segment interpreted by the instruction
    * immediate value, e.g. memory address
    * 2 registers (4-bit + 4-bit) + immediate value (16-bit)
    * etc
  * Default instruction set includes 16 load and 16 store instructions where the source/target
    register is implicitly encoded in the opcode itself. This leaves 224 other instructions.
* Memory Management Unit
  * Maps a 24-bit address space to "chips" and "controllers"
  * An address can be mapped to multiple "chips"
  * Writing to an unmapped address is a no-op
  * Reading from an unnamed address returns 0
  * Writing to a multi-mapped address writes to all mapped chips at that address
  * Reading from a multi-mapped address ORs the return value from all mapped chips

### Chips / Controllers

* Memory chip (stores and retrieves a value)
* "Video" chip - output graphics
* "Keyboard" chip - returns input
