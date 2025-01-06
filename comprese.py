from PIL import Image

class Node:
    def __init__(self,frequency,colors=None,left=None,right=None):
        self.frequency = frequency
        self.colors = colors
        self.left = left
        self.right = right
    def set_right(self,node:"Node"):
        self.right = node
    def set_left(self,node:"Node"):
        self.left = node
        
def find_infrequent_node(nodes:list[Node]):
    ordered = sorted(nodes,key = lambda x: x.frequency, reverse=True)
    return ordered[0],ordered[1]


def huffman(img:Image, block_size:int)->list:
    img_data = list(img.getdata())
    block_frequency = {}

    blocs = [tuple(img_data[n:n+block_size]) for n in range(0, len(img_data), block_size)]

    for block in blocs:
        if block in block_frequency:
            block_frequency[block] += 1
        
        else:
            block_frequency[block] = 1
        
    ordered = list(block_frequency.items())
    tree = [Node(item[1],item[0]) for item in ordered]
    leafs = tree.copy()
    roots = len(tree)

    while roots !=1:
        min, minn = find_infrequent_node(tree)
        cum_frequency = min.frequency + minn.frequency

        above = Node(cum_frequency,0,min,minn)
        tree.append(above)

        min.frequency = float("inf")
        minn.frequency = float("inf")

        roots -=1

    # rozdělit blokům kódy abychom měli slovník blok:kód

    for node in tree:
        if node.frequency == float("inf"):
            continue
        if node.colors !=0:
            continue
        root = node

    for leaf in leafs:
        pass
        
    return tree

result = huffman(Image.open("random.png"),2)




# napsat celý ten obrázek jako posloupnost bloků 
