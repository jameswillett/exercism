def do_math(n):
    if n % 2 == 0:
        return n / 2
    else:
        return 3 * n + 1

def collatz_steps(number):
    if number < 1:
        raise ValueError(":(")
    last_step = number
    i = 0
    for x in range(0, number):
        if last_step == 1:
            break
        last_step = do_math(last_step)
        i += 1
    return i
