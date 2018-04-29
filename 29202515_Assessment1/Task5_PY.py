"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""

prompt = "Enter the year to check if it is leap:"
isLeapMsg = "Is leap year!!"
notLeapMsg = "Is not a leap year!!"
year = 0

# Function reads in a year and returns True if its leap
# and false if it is not a leap year
def is_leap_year(year):

    """
    Function reads in a year and returns True if its leap and false if it is not a leap year

    The is_leap_year function reads user year input (year) and checks if its a leap year or not.
    It then returns a boolean value of True or False to its caller.

    @:param (int)year: This is the user's requested year
    @:return: (bool) True if the year is leap. False otherwise
    @pre-condition: -
    @post-condition: -
    @complexity: Worst-Case: O(1)
    @complexity: Best-Case:  O(1)
    @exeception(raises): -
    
    """
    # First check if divisible by 400
    if year%400 == 0:
        # If a year is divisible by 400, then it is leap
        return  1
    # If not divisible by 400, check divisibility by 100
    elif year%100 == 0:
        # If they year is not divisible by 400, but divisible by 100,
        # then it is NOT a leap year. So, return False
        return 0
    elif year%4 == 0:
        # If they year is neither divisible by 400, nor by 100,
        # then check if divisible by 4. If yes, return True
        return 1
    # All the other cases are not leap years
    else:
        return 0

print(prompt)
year = int(input()) #change made!!!

if is_leap_year(year) == 0:
    print(notLeapMsg)
else:
    print(isLeapMsg)




