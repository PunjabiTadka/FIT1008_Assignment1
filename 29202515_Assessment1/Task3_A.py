"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""

def populateList(size):

    """
    This function takes in the size as an argument,
    and accepts 'size' number of inputs from the user, stores them in
    a list and returns it

    @:param size: The number of inputs to accept from the user
    @:return: my_list: The list containing 'size' number of numbers
    @pre-condition:
    @post-condition:
    @complexity: Worst-Case: O(n)
    @complexity: Best-Case: O(n)
    @exeception(raises):

    """
    # Allocate the memory to store the list
    my_list = [0]*size

    print("Enter the temperatures: ")
    for i in range(size):
        item = int(input())
        my_list[i] = item

    return my_list

def count(myList):

    """
    This function counts the number of values in the list
    that exceed a given value

    @:param myList: The list of numbers
    @:return: count: The number of values in the list that are greater than the baseTemp
    @pre-condition:
    @post-condition:
    @complexity: Worst-Case: O(n)
    @complexity: Best-Case: O(n)
    @exeception(raises):

    """
    # Set the count to 0
    count  = 0
    # Read in the base temp
    baseTemp = int(input("Enter the base temperature: "))

    for i in range(n):
        if myList[i] > baseTemp:
            count += 1

    return count

n = int(input("Enter the size of the list: "))
my_list = populateList(n)
print('the count is:'+str(count(my_list)))

