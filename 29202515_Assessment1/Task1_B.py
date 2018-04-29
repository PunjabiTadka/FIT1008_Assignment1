"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""

prompt = 'Enter a year:'
isLeap = 'Is leap year!'
notLeap = 'Is not a leap year'
year = 0

print(prompt)
year = int(input())

if year%400 == 0:
    print(isLeap)
elif year%100 == 0:
    print(notLeap)
elif year%4 == 0:
    print(isLeap)
else:
    print(notLeap)
