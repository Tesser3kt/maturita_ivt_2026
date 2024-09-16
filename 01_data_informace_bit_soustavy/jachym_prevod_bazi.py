def convert(number:str,base_from:int,base_to:int):
    alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    base_from-=1
    base_to-=1

    max_base_to = alphabet[base_to]
    max_base_from = alphabet[base_from]

    print("max from each base",max_base_from,max_base_to)

    decimal = 0
    for i,s in enumerate(number):
        position = [i for i,value in enumerate(alphabet) if s==value]
        if not position:
            print("aaa",s)
        decimal += position[0]*(base_from+1)**(len(number)-i-1)

    result = []

    while decimal:
        remainder = decimal % (base_to+1)
        decimal //= (base_to+1)
        result.append(remainder)

    result.reverse()
    print(result)
    ans ="".join([alphabet[i] for i in result])
    print("final",ans)
        

convert("SUSBALLS",36,15)