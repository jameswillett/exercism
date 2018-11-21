def translate(c, its_the_end):
    if c.isdigit():
        return int(c)
    
    if c == 'x' and its_the_end:
        return 10
    
    raise ValueError()

def verify(isbn):
    normalized = [ c for c in isbn.lower() if c.isalnum() ]
    l = len(normalized)

    if l != 10:
        return False

    try:
        numbers = [ translate(normalized[n], n == l - 1) for n in range(0, l) ]
    
    except ValueError:
        return False

    return sum([ numbers[i] * (10 - i) for i in range(0, 10) ]) % 11 == 0
