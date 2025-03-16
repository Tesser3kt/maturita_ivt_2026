from random import randint

SIZE = 10 ** 5
RANGE = 10 ** 5


def merge(l1, l2) -> list:
    i, j = 0, 0
    ans = []
    while i < len(l1) and j < len(l2):
        if l1[i] <= l2[j]:
            ans.append(l1[i])
            i += 1
        else:
            ans.append(l2[j])
            j += 1

    while i < len(l1):
        ans.append(l1[i])
        i += 1

    while j < len(l2):
        ans.append(l2[j])
        j += 1

    return ans


def mergesort(data):
    if len(data) <= 1:
        return data
    half = len(data) // 2
    L = mergesort(data[:half])
    R = mergesort(data[half:])

    return merge(L, R)


pole = [randint(1, RANGE) for _ in range(SIZE)]
print(pole)
print(mergesort(pole))
