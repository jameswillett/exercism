from math import gcd

m = 26

def guard(a):
    if gcd(a, m) > 1:
        raise ValueError("a and m must be coprime.")

def encode(plain_text, a, b):
    guard(a)

    def cipher(char):
        if char.isdigit():
            return char
        x = ord(char) - 97
        return chr((a * x + b) % m + 97)

    ciphered_chars = "".join([ cipher(d) for d in [ c for c in plain_text.lower() if c.isalnum() ]])
    
    chunks = len(ciphered_chars) // 5
    if len(ciphered_chars) % 5 != 0:
        chunks += 1

    return " ".join([ ciphered_chars[i*5:i*5+5] for i in range(0, chunks) ])
 

def decode(ciphered_text, a, b):
    guard(a)
    
    def mmi(z):
        for i in range(0, m):
            if (z*i) % m == 1:
                return i       

    def decipher(char):
        if char.isdigit():
            return char
        y = ord(char) - 97
        return chr(mmi(a) * (y - b) % m + 97)

    return "".join([ decipher(d) for d in [c for c in ciphered_text if c.isalnum() ]])
