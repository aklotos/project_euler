# This Python file uses the following encoding: utf-8
# Problem 25. 1000-digit Fibonacci number
# The Fibonacci sequence is defined by the recurrence relation:
#
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
#
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?


class BigInt(object):
    def __init__(self, num):
        self.num = num

    def add(self, other):
        rev_a = self.num[::-1]
        rev_b = other.num[::-1]
        out = ''

        max_rank = max(len(self.num), len(other.num)) + 1
        shift = False
        for i in range(0, max_rank):
            a = int(rev_a[i]) if len(rev_a) > i else 0
            b = int(rev_b[i]) if len(rev_b) > i else 0
            ab_sum = a + b + (1 if shift else 0)

            if not (i + 1 == max_rank and ab_sum % 10 == 0):
                out += str(ab_sum % 10)

            shift = ab_sum >= 10
        return BigInt(out[::-1])

    def get_digits(self):
        return len(self.num)

    def __str__(self):
        return self.num


def find_fibonacci_index(digits):
    prev_num = BigInt('1')
    cur_num = BigInt('1')
    next_num = BigInt('1')
    index = 2
    while next_num.get_digits() < digits:
        next_num = cur_num.add(prev_num)
        prev_num = cur_num
        cur_num = next_num
        index += 1
    return index


def main():
    print('index = {}'.format(find_fibonacci_index(1000)))


main()
