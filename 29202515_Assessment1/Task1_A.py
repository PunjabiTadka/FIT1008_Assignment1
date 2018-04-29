"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""


def is_leap_year(year):
    """
    Function reads in a year and returns True if its leap and false if it is not a leap year

    The is_leap_year funtion reads user year input (year) and checks if its a leap year or not. 
    It then returns a boolean value of True or False to its caller. 
    
    @:param (int)year: This is the user's requested year
    @:return: (bool) True if the year is leap. False otherwise
    @pre-condition: None
    @post-condition: None
    @complexity: Worst-Case: O(1)
    @complexity: Best-Case:  O(1)
    """

    # First check if divisible by 400
    if year%400 == 0:
        # If a year is divisible by 400, then it is leap
        return  True
    # If not divisible by 400, check divisibility by 100
    elif year%100 == 0:
        # If they year is not divisible by 400, but divisible by 100,
        # then it is NOT a leap year. So, return False
        return False
    elif year%4 == 0:
        # If they year is neither divisible by 400, nor by 100,
        # then check if divisible by 4. If yes, return True
        return True
    # All the other cases are not leap years
    else:
        return False

# Ask the user to input a year and convert it into integer
year = int(input("Enter the year to check if it is leap:"))
# Check if the year is leap
if is_leap_year(year):
    # IF yes, print the "is leap message"
    print("It is a leap year")
else:
    # Otherwise, print the is not leap message
    print("It is not a leap year")
