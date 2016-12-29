/**
 Non-abundant sums
 A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
 For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means
 that 28 is a perfect number.
 A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant
 if this sum exceeds n.
 As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written
 as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers
 greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit
 cannot be reduced any further by analysis even though it is known that the greatest number
 that cannot be expressed as the sum of two abundant numbers is less than this limit.
 Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 */

'use strict';

const _ = require('lodash');
const MAX = 28124;

function problem_23() {
    const abundant = findAbundantNumbers(MAX);

    let temp = [];
    let cantBeSumOfAbundantSum = 0;
    for (let number = 1; number < MAX; number++) {
        let found = false;
        _.forEach(abundant, (val, key) => {
            if (key > number / 2) {
                return false;
            }
            if (abundant[key] && abundant[number - key]) {
                found = true;
                return false;
            }
        });
        if (!found) {
            temp.push(number);
            cantBeSumOfAbundantSum += number;
        }
    }
    console.log('result: ', cantBeSumOfAbundantSum);
}

problem_23();

/**
 * Finds all abundant numbers up to specified maximum.
 */
function findAbundantNumbers(max) {
    const abundant = [];
    for (let number = 1; number < max; number++) {
        const properDivisors = [];
        const sqrt = Math.sqrt(number);
        for (let divisor = 1; divisor <= sqrt; divisor++) {
            if (number % divisor === 0) {
                properDivisors.push(divisor);
                if (divisor > 1 && number / divisor !== divisor) {
                    properDivisors.push(number / divisor);
                }
            }
        }
        if (_.sum(properDivisors) > number) {
            abundant[number] = true;
        }
    }

    return abundant;
}