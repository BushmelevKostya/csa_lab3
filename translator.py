from PL.ISA import *


class Translator:
    def split_string(self, string):
        return string.split()


    def readlines(self, filename):
        try:
            with open(filename, 'r') as file:
                lines = file.readlines()
                lines = [line.strip() for line in lines]
            return lines
        except FileNotFoundError:
            print("File not found")
            return []

    def translate(self, input: str) -> list[Instruction]:
        instructions = []
        lines = [self.split_string(line) for line in self.readlines(input)]
        lines = [line for line in lines if len(line) != 0]

        for line in lines:
            print(line)

        for i in range(len(lines)):
            # instructions.append(Instruction(i, opcode, operand, addressing))
            pass
        return instructions

def main(input: str, output: str):
    translator = Translator()
    translator.translate(input)


if __name__ == "__main__":
    main("PL/prog_ex1.asm", "output.txt")
