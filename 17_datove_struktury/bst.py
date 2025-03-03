class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BST:
    def __init__(self):
        self.root = None

    def __add_node(self, node, value):
        if value == node.value:
            return

        if value < node.value:
            if node.left:
                self.__add_node(node.left, value)
            else:
                node.left = Node(value)
        else:
            if node.right:
                self.__add_node(node.right, value)
            else:
                node.right = Node(value)

    def add(self, value):
        if not self.root:
            self.root = Node(value)
        self.__add_node(self.root, value)

    def __find_value(self, node, value):
        if value == node.value:
            return True

        if value < node.value:
            if node.left:
                return self.__find_value(node.left, value)
            else:
                return False
        else:
            if node.right:
                return self.__find_value(node.right, value)
            else:
                return False

    def find(self, value):
        if not self.root:
            return False
        return self.__find_value(self.root, value)
