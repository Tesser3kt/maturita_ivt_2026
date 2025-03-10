class Node:
    def __init__(self, value):
        self.value = value
        self.next = None


class List:
    def __init__(self):
        self.root: Node = None
        self.end: Node = None

    def append(self, value: int):
        nend = Node(value)

        if self.end:
            self.end.next = nend
        else:
            self.root = nend

        self.end = nend

    def pop(self) -> int:
        next = self.root
        last = None
        while next != self.end:
            last = next
            next = next.next

        if last:
            last.next = None
            return last.value
        else:
            return None

    def prepend(self, value: int):
        rut = Node(value)

        if not self.root:
            self.end = rut
        else:
            rut.next = self.root

        self.root = rut

    def insert(self, index: int, value: int) -> None:
        next = self.root
        cumter = 0
        if index == 0:
            self.prepend(value)
            return
        while next:
            if cumter == index - 1:
                new = Node(value)
                new.next = next.next
                next.next = new
                return
            cumter += 1
            next = next.next

    def delete(self, index: int) -> None:
        previous = self.root
        iter = 0

        if index == 0:
            self.root = self.root.next
            return

        while iter < index - 1:
            if not previous:
                return

            previous = previous.next
            iter += 1

        previous.next = previous.next.next

    def print(self):
        next = self.root
        while next:
            print(next.value, end=" ")
            next = next.next
