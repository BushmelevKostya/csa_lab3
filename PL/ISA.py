from enum import Enum


class Opcode(Enum, str):
    ADD = "add"
    SUB = "sub"
    MUL = "mul"
    DIV = "div"
    LD = "ld"
    ST = "st"
    HLT = "hlt"
    JMP = "jmp"

    def __str__(self):
        return str(self.value)


class Addressing(Enum, str):
    MEM = "mem"
    DIR = "dir"

    def __str__(self):
        return str(self.value)


class Instruction:
    def __init__(self, address: int, opcode: Opcode, operand: int, addressing: Adressing):
        self.address = address
        self.opcode = opcode
        self.operand = operand
        self.addressing = addressing
