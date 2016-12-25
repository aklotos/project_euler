/**
 Problem 21
 Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
 For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
 The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
 Evaluate the sum of all the amicable numbers under 10000.
 */

'use strict';

function problem_21() {
    const numToDivsum = fillNumToDivsum(10000);
    markAmicable(numToDivsum);
    const amicableSum = numToDivsum.reduce((result, num) => num.amicable ? result + num.sum : result, 0);
    console.log(amicableSum);
}

/**
 * Finds and persists sum of the proper divisors of all numbers up to specified maximum.
 */
function fillNumToDivsum(max) {
    const numToDivsum = [];
    for (let number = 1; number < max; number++) {
        const properDivisors = [];
        const sqrt = Math.sqrt(number);
        for (let divisor = 1; divisor < sqrt; divisor++) {
            if (number % divisor === 0) {
                properDivisors.push(divisor);
                if (divisor > 1) {
                    properDivisors.push(number / divisor);
                }
            }
        }
        numToDivsum[number] = {sum: properDivisors.reduce((result, next) => result + next, 0)};
    }

    return numToDivsum;
}

/**
 * Marks all the amicable numbers by definition.
 */
function markAmicable(numToDivsum) {
    for (let num = 2; num < 10000; num++) {
        const divisorSum = numToDivsum[num].sum;
        if (divisorSum < 10000 && divisorSum !== num && numToDivsum[divisorSum].sum === num) {
            numToDivsum[num].amicable = true;
            numToDivsum[divisorSum].amicable = true;
        }
    }
}

problem_21();