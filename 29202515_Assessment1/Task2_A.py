"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""

def get_range(my_list):

    """
    This function calculates the range of a given list of number.
    The range is defined as the difference between maximum and minimum values in the list

    @:param my_list: list of numbers
    @:return: (int) range: the difference between the max value and min value in the array
    @pre-condition:
    @post-condition:
    @complexity: Worst-Case: O(n)
    @complexity: Best-Case: O(n)
    @exeception(raises): 
    
    """

    max_item = my_list[0]
    min_item = my_list[0]

    for item in the_list:
        if item > max_item:
            max_item = item
        elif item < min_item:
            min_item = item

    return max_item - min_item

# Accept the size of the list as an input from the user
n = int(input("Enter the size of the list: "))
# Allocate memory to store a list of size 'n' and initialize them to 0
the_list = [0]*n
for i in range(n):
    item = int(input("Enter the item: "))
    the_list[i] = item

print("The range is: ", get_range(the_list))
