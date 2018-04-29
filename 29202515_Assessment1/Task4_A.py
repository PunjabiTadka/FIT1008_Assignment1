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

     @pre-condition: -
     @post-condition: -
     @complexity: Worst-Case: O(n)
     @complexity: Best-Case: O(n)
     @exeception(raises): -
     """

    # Allocate the memory to store the list
    my_list = [0] * size

    print("Enter the temperatures: ")
    for i in range(size):
        item = int(input())
        my_list[i] = item

    return my_list


def bubble_sort(myList):

    """
    This function sorts a given list of integers in place
    using the bubble sort algorithm

    @:param myList: List of numbers to sort
    @:return: None
    @pre-condition: -
    @post-condition: The given list 'myList' is sorted in place
    @complexity: Worst-Case: O(n^2)
    @complexity: Best-Case: O(n^2)
    @exeception(raises): -

    """
    size = len(myList)
    for i in range(size):
        for j in range(0, size-i-1):
            if myList[j] > myList[j + 1]:
                temp = myList[j]
                myList[j] = myList[j+1]
                myList[j+1] = temp

    return myList


def count(size, myList):

    """
    This function counts the frequency of each number in the list and prints it

    @:param size: size of the list
    @:param myList: The list of numbers
    @:return: None
    @pre-condition: -
    @post-condition: -
    @complexity: Worst-Case: O(n^2)
    @complexity: Best-Case: O(n^2)
    @exeception(raises): -
    """
    bubble_sort(myList)
    i = 0
    while i < size:
        count = 0
        for j in range(i, size):
            if j == size - 1:
                count += 1
                print(str(myList[i]) + " appears " + str(count) + " times")
                i = j
                break
            if myList[j] == myList[i]:
                count += 1
                continue
            else:
                print(str(myList[i]) + " appears " + str(count) + " times")
                i = j - 1
                break
        i += 1


n = int(input("Enter the size of the list: "))
my_list = populateList(n)
count(n, my_list)
