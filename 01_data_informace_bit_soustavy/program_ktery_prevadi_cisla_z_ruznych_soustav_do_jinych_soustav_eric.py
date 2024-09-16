def to_base10(number: str, base_from: int) -> int:
    number = number.lower()
    base10_number = 0
    for i, digit in enumerate(number[::-1]):
        if digit.isdigit():
            digit = int(digit)
        else:
            digit = ord(digit) - ord('a') + 10
        base10_number += digit * (base_from ** i)
    return base10_number

def to_alphabet(digit: int) -> str:
    if digit < 10:
        return str(digit)
    return chr(digit - 10 + ord('a'))

def from_base10(number: int, base_to: int) -> str:
    if number == 0:
        return "0"
    digits = []
    while number:
        digits.append(int(number % base_to))
        number //= base_to
    return ''.join(to_alphabet(x) for x in digits[::-1])

def convert_base(number: str, base_from: int, base_to: int) -> str:
    base10_number = to_base10(number, base_from)
    return from_base10(base10_number, base_to)

number = "balls"
base_from = 29
base_to = 29

converted_number = convert_base(number, base_from, base_to)
print(f"{number} from base {base_from} to base {base_to} is {converted_number}")