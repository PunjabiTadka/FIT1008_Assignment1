"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""

prompt = "Enter the size of the list: "
itemPrompt = "Enter the item: "
resultMsg = "The range is: "
the_list = [0]*100

n = 0
maxItem = 0
minItem = 0

print(prompt)
n = int(input())

i = 0

while i < n:
    print(itemPrompt)
    the_list[i] = int(input())
    i += 1

maxItem = the_list[0]
minItem = the_list[0]

# for item in the_list:
i = 0
while i < n:
    item = the_list[i]
    if item >  maxItem:
        maxItem = item
    elif item < minItem:
        minItem = item
    i += 1

print(resultMsg, str(maxItem - minItem))
