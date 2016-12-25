/**
 Problem 20
 n! means n × (n − 1) × ... × 3 × 2 × 1

 For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

 Find the sum of the digits in the number 100!
 */

'use strict';

const bigint = require('big-integer');

function problem20() {
    // computes 100!
    let prod = bigint(1);
    for (let i = 1; i < 101; i++) {
        prod = prod.multiply(i);
    }

    // computes sum of digits
    const result = prod.toString().split('').reduce((result, v) => {
        return result + parseInt(v)
    }, 0);

    console.log(result);
}

problem20();