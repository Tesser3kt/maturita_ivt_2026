from random import randint

SIZE = 10**5
RANGE = 10**5

data = [randint(1, RANGE) for _ in range(SIZE)]


def counting_sort(data, rng):
    """Counting sort function"""

    # counting frequencies
    lookup = [0] * rng
    for dato in data:
        lookup[dato] += 1

    # writing answer
    ans = []
    for i, value in enumerate(lookup):
        for _ in range(value):
            ans.append(i)
    return ans


ans = counting_sort(data, RANGE + 1)
print(ans)
