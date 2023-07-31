# list 

from calendar import formatstring


l = [ 3, 4 , 5, 6]  #mutable
l1 = [None]*5 # a list with 5 unknowns
l2 = [0]*5 # a list with 5 zeros
print(l)
print(l1)
print(l2,'\n')

# list iteration - two ways
# 1. through len and range
# 2. through keyword in
# 3. other helper functions = enumerate(),range(),zip()

for i in l : 
    print(i,end=" ")
print('\n')
# printing reverse list
for i in range(len(l)-1,-1,-1):
    print(l[i],end=" ")
print('\n')
'''
To iterate over each item of a list, but also have access to the current 
loop number. This functionally is made available via the enumerate() command.
'''
for i, x in enumerate(l):
    print(i,":",x," , ",end=" ")
print('\n')
'''
 Because iterating over two or more lists of the same length is so common,
 Python has a zip() command to do just that.
 loop will run till the lenght of the shortest list present 
'''
heights = [165, 178, 199, 182, 174]
for x,y in zip(l, heights):
    print(x,y,end=" ")
print()

'''
 looping over one or more list and computing new values is so common, 
 Python has something called list comprehension that allows us to create
 a for loop on a single line of code. The basic structure is pretty simple:
 
new_variable = [f(i) for i in x]
'''

squares = [x**2 for x in l]
print("squares : " ,squares)
print('\n')
# list searching 
# its done using if..in syntax

# list slicing
'''
list    -    3 4 5 5 6 7 8
index   -    0 1 2 3 4 5 6
reverse - (-)7 6 5 4 3 2 1
index
'''

# list functions

'''
1. append(x)   -- append the x at the end of the list
2. insert(x,i) -- insert the element x at position i

3. pop(i) -- removes the element present at the index i , default last -- index wise deletion
4. remove(x) -- removes the first occurance of the item x -- element wise deletion

5. index(x) - gets the index of the first occurance of the element x
6. sort() - has a reverse flag which can be set to 1 , default is accending
7. reverse()
'''

# tuple
print("tuple")
t = 3,4,5,6,"d","fed"
t1 = (3,4,5,6,"d","fed")
# for a single value
t2 = 4,   # ',' is necessary to tell the python that its a tuple not just a number
t3 = (5,)
print(type(t)," ",type(t1)) # () are optional 

# strings
print("strings")
'''

In Python, string is a data type and anything enclosed
in a single quote or double quote is considered to be a 
string. All the remaining operations are similar to lists.
But like tuple, strings are also IMMUTABLE.

'''
s = "df dfsa gED f"

# other functions

# 1. s.count(x)  - returns the count of character x present in the string
# 2. s.replace("x13","x232") - replaces a set of characters(x13) with another set of characters(x232)
# 3. s.find(x)   - returns the index of character x
# 4. s.startswith("fds") - boolean
# 5. s.endswith("fds") - boolean
# 6. s.upper() - returns a new string with upper case letters
# 7. s.lower() - returns a new string with lower case letters
# 8. s.isdigit() - checks if all the characters in string are digits or not , boolean
# 9. s.split(delimiter) - splits the string according to the delimiter , default delimiter is space

s.upper()
print(s)
print(s.index("s"))
print(s.find("s"),'\n')

# Dictionary 
print("Dictionary")
# The key should be unique and can be of any immutable data type(strings,tuple). 
dic = {"nisarg":"great",(3,4):5,"four":4,5:"five"}
print(dic[(3,4)])
print(dic["four"])
print(dic[5])
# iterating
for key,value in dic.items():
    print("key: {:<8} | value : {:<6} |".format(str(key),str(value),"e"))

# functions
# 1. get("key") <- gets the value of the given key if present otherwise None is return
# 2. update({"key:value"})<- updates if the given key value pair if present or adds it otherwise


# formatting
print("\n Formatting \n")
from math import pi

print('Pi with 6 total spaces, including 5 digits after the decimal point {:6.5f}'.format(pi))
# .format()
print ('{:=<20}'.format('hello'))
print ('{:_^20}'.format('hello'))
print ('{:|>20}'.format('hello'))

# Revised to use f-strings
print (f'{"hello":=<20}')
print (f'{"hello":_^20}')
print (f'{"hello":|>20}')

'''
 "{:<20}".format(x) -- this assigns a 20 white spaces and left aligns the item x in it
 "{:>8}".format(x) -- this assigns a 8 white spacesa and right aligns the item x in it
 "{:=<12}".format(x) -- this assigns a 12 = equals and left aligns the item x in it
 "{:<20} : {:>12}".format(x,y) -- this assigns 20 white spaces and aligns item x in it and then assigns
                                  another 12 white spaces continues to the previously assignes spaces 
                                  and insert y(right aligned) in it
 fstrings are simililar
 f"{x:<20}" does the same thing as "{:<20}".format(x)
'''
for key,value in dic.items():
    print(f"key: {str(key):<8} | value : {str(value):<6}")
    
# Sets
