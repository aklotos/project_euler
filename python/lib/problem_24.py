# Problem 24. Lexicographic permutations
# A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation
# of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically,
# we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?


def main():
    numbers = list(range(0, 10))
    order = 10 ** 6

    print('result: {}'.format(lexicographic_perm_order(numbers, order)))
    return


def lexicographic_perm_order(numbers, order):
    output = 0

    while order > 0 and len(numbers) > 0:
        next_index = 0
        perm_for_next = factorial(len(numbers))

        while order > perm_for_next:
            next_index += 1
            order -= perm_for_next

        output *= 10
        output += numbers[next_index]
        del numbers[next_index]

    return output


def factorial(n):
    res = 1
    for i in range(1, n):
        res *= i
    return res


main()
