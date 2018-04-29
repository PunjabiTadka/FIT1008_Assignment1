"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""
prompt = "Enter the size of the list: "
tempPrompt = "Enter the temperatures: "
baseTempPrompt = "Enter the base temperature: "
countMsg = "The count is: "
n = 0
i = 0
my_list = [0]*100
# Set the count to 0
count  = 0
baseTemp = 0

print(prompt)
n = int(input())

i = 0
while i < n:
    print(tempPrompt)
    my_list[i] = int(input())
    i += 1

# Read in the base temp
print(baseTempPrompt)
baseTemp = int(input())

i = 0
while i < n:
    if my_list[i] > baseTemp:
        count += 1
    i += 1

print(countMsg+str(count))
