import re

def is_pangram(sentence):
    return len(set(re.sub("[^a-z]", "", sentence.lower()))) == 26
