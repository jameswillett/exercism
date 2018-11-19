from random import choice
from string import ascii_uppercase, digits

names = []

def random_name():
    name = ""
    for i in range(0, 5):
        if i < 2:
            name += choice(ascii_uppercase)
        else:
            name += choice(digits)
    if name not in names:
        names.append(name)
        return name
    else:
        return random_name()

class Robot(object):
    def __init__(self):
        self.name = random_name()
    def reset(self):
        self.name = random_name()
