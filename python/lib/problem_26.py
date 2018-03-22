# Problem 26. Reciprocal cycles
# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions
# with denominators 2 to 10 are given:
#
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
# It can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.


def main():
    max_cycle_num = 0
    max_cycle_len = 0
    for i in range(2, 1001):
        cycle_len = len(recurring_cycle(1, i))
        if cycle_len > max_cycle_len:
            max_cycle_len = cycle_len
            max_cycle_num = i

    print('result = {}'.format(max_cycle_num))
    return


def recurring_cycle(num, den):
    num = num % den
    rems = dict()
    rec_cycle = []
    counter = 0

    while num not in rems:
        rems[num] = counter
        num *= 10
        rec_cycle.append(num // den)
        num = num % den
        counter += 1

    return rec_cycle[rems[num]:]


main()
