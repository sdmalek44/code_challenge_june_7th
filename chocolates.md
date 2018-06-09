Sal is an instructor. They want to give some chocolate to the students in their class to reward them for a job well done
on a recent test. The students arrange themselves in a line (perhaps alphabetically). Each student has an integer score
from 0 to 100 on the test. Sal wants to give at least 1 chocolate to each student. Students get jealous of their
immediate neighbors, so of two adjacent students whichever student has a higher score on the test must get one extra
piece of chocolate than the student with the lower score. Sal wants to save money, so they wants to minimize the total
number of chocolates they must buy.

Restrictions:
each student must get at least 1 chocolate
you cannot rearrange the students
you should allow for up to 100,000,000 students

Examples:
test grades: 100, 90, 80
chocolates: 3, 2, 1
total chocolates needed: 6

test grades: 80, 90, 100
chocolates: 1, 2, 3
total chocolates needed: 6

test grades: 100, 80, 90
chocolates: 2, 1, 2
total chocolates needed: 5

test grades: 55, 91, 23, 27, 25, 41, 42, 32, 20, 82, 35, 45, 69, 33, 58
chocolates: 1, 2, 1, 2, 1, 2, 3, 2, 1, 2, 1, 2, 3, 1, 2
total chocolates needed: 26

test grades: 98, 25, 69, 84, 89, 49, 86, 97, 68, 86,
chocolates:   2,  1,  2,  3,  4,  1,  2,  3,  1,  2,
total chocolates needed: 21

note: because this algorithm has two 'for' loops in it, we're
technically looking at our data twice, so for 100M students, this
would represent 200M lookups, but when we think of big-O notation
we only count one iteration at a code "depth" level. If these were
nested for loops (a for loop within a for loop) then we would
say this is an n-squared solution, O(n^2)
We're also using a lot of extra memory, but this is the tradeoff
we make as programmers: do we use memory or do we use CPU, or is
there a balance of each. This algorithm uses 3 additional data
structures to hold our left/right sequences, plus a final
distribution, so we would say our "space complexity" is 4x
