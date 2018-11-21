def is_isogram(string):
    normalized = [ c for c in string.lower() if c.isalpha() ] 
    return len(set(normalized)) == len(normalized)
