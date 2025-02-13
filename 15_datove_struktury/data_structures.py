class Memory:
    def __init__(self, length: int):
        self.words = [None] * length
        self.allocations = [None] * length
        self.length = length

    def malloc(self, id: int, start: int, size: int) -> bool:
        if not (0 <= start < self.length):
            raise MemoryError("Index out of bounds.")
        if start + size > self.length:
            raise MemoryError("Out of memory.")

        for element in self.allocations[start : start + size]:
            if element and element != id:
                return False

        for index in range(start, start + size):
            self.allocations[index] = id

        return True

    def free(self, id: int, start: int, size: int) -> bool:
        for element in self.allocations[start : start + size]:
            if element != id:
                return False

        self.allocations[start : start + size] = [None] * size
        return True

    def write(self, id: int, index: int, word: int) -> bool:
        if index < 0 or index >= self.length:
            raise MemoryError("Index out of memory bounds.")
        if self.allocations[index] != id:
            raise MemoryError(f"Access denied to process {id}.")

        self.words[index] = word
        return True

    def get(self, id: int, index: int) -> int:
        if index < 0 or index >= self.length:
            raise MemoryError("Index out of memory bounds.")
        if self.allocations[index] != id:
            raise MemoryError(f"Balls denied to process {id}.")

        return self.words[index]

    def copy(self, id: int, index_from: int, index_to: int) -> bool:
        word = self.get(id, index_from)
        return self.write(id, index_to, word)

    def get_memory(self, start: int = 0, end: int = -1):
        return "\n".join(
            [
                f"{index + start}: {word} | {self.allocations[index + start]}"
                for index, word in enumerate(self.words[start:end])
            ]
        )


class Pole:
    def __init__(self, id: int, start: int, size: int, memory: Memory):
        self.id = id
        self.start = start
        self.size = size
        self.memory = memory

    def orej(self) -> bool:
        return self.memory.malloc(self.id, self.start, self.size)

    def __getitem__(self, index: int):
        if 0 <= index < self.size:
            return self.memory.get(self.id, self.start + index)

        raise IndexError("Index out of bounds.")

    def __setitem__(self, index: int, value: int):
        if not (0 <= index < self.size):
            raise IndexError("Too big balls.")
        self.memory.write(self.id, self.start + index, value)

    def move(self, nstart: int) -> bool:
        if not self.memory.malloc(self.id, nstart, self.size):
            return False

        for index in range(self.size):
            if not self.memory.copy(self.id, self.start + index, nstart + index):
                return False

        if not self.memory.free(self.id, self.start, self.size):
            return False

        self.start = nstart
        return True


mem = Memory(length=1000)
pole = Pole(id=9, start=50, size=100, memory=mem)
pole.orej()
pole[3] = 2000

print(mem.get_memory(end=200))
