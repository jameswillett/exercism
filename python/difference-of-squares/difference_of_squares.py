def square_of_sum(count):
    return sum(range(0, count + 1)) ** 2

def sum_of_squares(count):
    return sum([ x ** 2 for x in range(0, count + 1) ])

def difference(count):
    return square_of_sum(count) - sum_of_squares(count)
