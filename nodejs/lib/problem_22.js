/**
 Problem 22
 Using problem_22_names.txt, a 46K text file containing over five-thousand first names,
 begin by sorting it into alphabetical order. Then working out the alphabetical value for each name,
 multiply this value by its alphabetical position in the list to obtain a name score.
 For example, when the list is sorted into alphabetical order, COLIN, which is worth
 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
 What is the total of all the name scores in the file?
 */

'use strict';

const _ = require('lodash');
const fsp = require('fs-promise');
const ASCII_UPPER_ALPHABET_START = 'A'.charCodeAt(0) - 1;

function problem_22() {
    fsp.readFile(__dirname + '/problem_22_names.txt')
        .then(buffer => {
            const content = buffer.toString()
                .split(/[",]/)
                .filter(_.identity);
            const sortedContent = mergeSort(content);

            let result = 0;
            sortedContent.forEach((name, index) => {
                const chars = name.split('').map(char => char.charCodeAt(0) - ASCII_UPPER_ALPHABET_START);
                result += (index + 1) * chars.reduce((res, val) => res + val, 0);
            });
            console.log(result);
        }, error => console.log('An error occurred while reading the file: ', error));

}

problem_22();


/**
 * Merge sort
 */
function mergeSort(array) {
    return mergeDivide(array, 0, array.length);
}

function mergeDivide(array, start, end) {
    if (end - start <= 1) {
        return array.slice(start, end);
    }

    const middle = start + Math.floor((end - start) / 2);

    const left = mergeDivide(array, start, middle);
    const right = mergeDivide(array, middle, end);
    return mergeUnion(left, right);
}

function mergeUnion(left, right) {
    let i = 0, j = 0;
    let union = [];
    while (i < left.length && j < right.length) {
        if (left[i] <= right[j]) {
            union.push(left[i++]);
        } else {
            union.push(right[j++]);
        }
    }
    if (i < left.length) {
        union = union.concat(left.slice(i));
    } else if (j < right.length) {
        union = union.concat(right.slice(j));
    }

    return union;
}