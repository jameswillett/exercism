import re

def double_check(word):
    if word.startswith('\'') and word.endswith('\''):
        return word[1:-1]
    return word

def word_count(phrase):
    words = [ double_check(w) for w in re.split(r'[^a-zA-Z0-9\']', phrase.lower()) if w != "" ]
    dict = {}
    for word in words:
        if word not in dict:
            dict[word] = 1
        else:
            dict[word] += 1

    return dict
