from random import randint

data = [randint(1, 10**5) for _ in range(10**5)]


def bubble_sort(data: list) -> None:
    for i in range(len(data)):
        for j in range(i + 1, len(data)):
            if data[i] > data[j]:
                data[i], data[j] = data[j], data[i]


bubble_sort(data)
print(data)
