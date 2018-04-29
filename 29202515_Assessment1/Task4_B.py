"""
@author: Amrita Kaur
@since: 16/3/2018
@modified: 17/3/2018
"""
prompt = "Enter the size of the list: "
size = 0
tempPrompt = "Enter the temperatures: "
appears = " appears "
times = " times"
my_list = [0] * 100
i = 0
j = 0
temp = 0

print(prompt)
size = int(input())

# Read input
print(tempPrompt)
i = 0
while i < size:
    my_list[i] = int(input())
    i += 1

# Sort
i = 0
while i < size:
    j = 0
    k = size - i - 1
    while j < k:
        if my_list[j] > my_list[j + 1]:
            temp = my_list[j]
            my_list[j] = my_list[j+1]
            my_list[j+1] = temp
        j += 1
    i += 1


i = 0
while i < size:
    count = 0
    j = i
    while j < size:
        if j == size - 1:
            if my_list[i] == my_list[j]:
                count += 1
            print(str(my_list[i]) + appears + str(count) + times)
            if my_list[i] == my_list[j]:
                i = j
            else:
                i = j-1
            j += 1
            break
        if my_list[j] == my_list[i]:
            count += 1
            j += 1
            continue
        else:
            print(str(my_list[i]) + appears + str(count) + times)
            i = j - 1
            j += 1
            break

    i += 1


