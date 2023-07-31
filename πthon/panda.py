import numpy as np
import pandas as pd

x = pd.Series(data = [3,4,5,2,9])
print(x)

print(x[1])
print(x[1:4])

print(x.values)
print(x.index)
x.index = ['first','second','third','fourth','fifth']
print(x,'\n\n')

print(" --- Creating Dataframe from series\n")
car_price_dict = {
    'Swift' : 700000,
    'Jazz' :  800000,
    'Civic' : 1600000,
    'Altis' : 1800000,
    'Gallardo': 30000000
}
car_man_dict = {'Swift' : 'Maruti',
                  'Jazz'   : 'Honda',
                  'Civic'  : 'Honda',
                  'Altis'  : 'Toyota',
                   'k' : 'Lamborghini'
                }
car_price = pd.Series(car_price_dict)
car_man = pd.Series(car_man_dict)
print(car_price,'\n')
print(car_man,'\n')

cars = pd.DataFrame({
                      'Price':car_price,
                      'Manufacturer':car_man
                   })

print(cars,'\n')

print(cars['Price'])
print("\n --- Creating Dataframe from List of dict\n")
data = [{'Name': 'Subodh', 'Marks': 28},
        {'Name': 'Ram', 'Marks': 27},
        {'Name': 'Abdul', 'Marks': 26},
        {'Name': 'John', 'Marks': 28}]
print(pd.DataFrame(data,index =["ID"+str(i) for i in range(4)]))

'''
One of the important parameters used while performing operations on DataFrames is 'axis'. Axis takes two values: 0 and 1.

axis = 0 represents row specific operations.
axis = 1 represents column specific operations.
'''
df = pd.read_csv("/Users/nisarg/Desktop/Coding/learnings/pandas files/Student Study data.csv")
print("\n",df.head())

df.info() # information about column and its content
print("\n",df.describe()) # generates a quick statistical summary of data

# it can be observed that "Marital Status" and "Study hour" has some null value
'''
df.dropna(inplace = True) can be used to drop all the rows with null values
inplace' makes changes to the original DataFrame.

df.fillna(condition) can be used to fill all the missing values. 
The missing values are filled with mean, median, mode, or constant values.

'''
dx = df.dropna() 
dx.info()
df.info()
# df.dropna(inplace = True) will change the df dataFrame itself
print()
print(df.head())

'''
iloc and loc are two indexing techniques used for accfessing 
1. iloc- Access a group of rows and columns by integer index.
2. loc - Access a group of rows and columns by custom index.

notes :
while retriving records using loc , upper range of slicing index is also counted
iloc follows implicit indexing => 0 1 2 .. 

'''

print(df.iloc[0:2,2]) # should print date
print()
print(df.loc[0:4,'Name':'Day']) # it will retrive the 4th row too
print()

'''
DataFrame.drop(labels=None, axis=0, index=None, columns=None, level=None, inplace=False, errors='raise')[source]
Drop specified labels from rows or columns.

1. Remove rows or columns by specifying label names and corresponding axis, 
2. By specifying directly index or column names. 
'''
# droping a coloumn
df.drop(columns="Day",inplace=True)
print(df.head())

print(df.drop(index=0).head())




