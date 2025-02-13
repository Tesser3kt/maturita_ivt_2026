class HashTable:
    def __init__(self, size: int):
        self.size = size
        self.array = [None] * size

    def __digit_sum(self, number):
        if number < 10:
            return number
        digit_sum = sum(int(x) for x in str(number))
        return self.__digit_sum(digit_sum)

    def __hash_function(self, word):
        final = 0
        for i, s in enumerate(word):
            final += self.__digit_sum(ord(s)) * 10**i
        return final % self.size

    def insert(self, key: str, value) -> bool:
        hash = self.__hash_function(key)
        if self.array[hash]:
            return False
        self.array[hash] = value
        return True


h = HashTable(1000)
