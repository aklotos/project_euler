/**
 Problem 19
 You are given the following information, but you may prefer to do some research for yourself.

 1 Jan 1900 was a Monday.
 Thirty days has September,
 April, June and November.
 All the rest have thirty-one,
 Saving February alone,
 Which has twenty-eight, rain or shine.
 And on leap years, twenty-nine.
 A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
 How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
 */

'use strict';

function problem_19() {
    let count = 0;
    let firstOfTheMonth = 2; // Jan, 1, 1901 is TUE from ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
    for (let year = 1901; year < 2001; year++) {
        for (let month = 1; month < 13; month++) {
            if (firstOfTheMonth % 7 === 0) {
                count++;
            }
            firstOfTheMonth += daysInMonth(month, year);
            firstOfTheMonth %= 7;
        }
    }
    console.log(count);
}

function daysInMonth(month, year) {
    switch (month) {
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        case 2:
            return ((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0) ? 29 : 28;
        default:
            return 31;
    }
}

problem_19();