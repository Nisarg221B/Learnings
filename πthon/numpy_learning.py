import numpy as np

#creating a list of 5 horsepower values
horsepower = [[130, 165, 150, 150, 140],[3,400,5,200,4]]

#creating a numpy array from horsepower list
horsepower_arr = np.array(horsepower)

x = np.where(horsepower_arr >= 150)
print(x)
print(type(x))
print(x[0][1])
# With the indices , we can find those values 
horsepower_arr[x]

filter = horsepower_arr > 135
new_array = horsepower_arr[filter]
print(filter)
print(new_array)
print("\n",horsepower)
print(np.sort(horsepower))

# horsepower.sort() // sorts horsepower internally

# concept of broadcasting
array1 = np.array([1,3,4,6]) # 1*4
array2 = np.array([5]) # 1*1

array3 = array1*array2 # 1*4 , 5 is broadcasted and array 2 is expanded to match dimention of array1
print(array3)
array4 = np.array([[2],[3],[5],[4]]) # 4*1
array5 = array1*array4 # 4*4 
# row of array 1 is expanded to make it 4*4 , and column of array2 is expanded to make it also 4*4

print(array5)


# arange - this methoda return equally spaced values between given numbers excluding the end limit.

# arange(yaha_se,yaha_tak,itna_step)

x = np.arange(8,18,3) # returns a numppy array
print(x)

# linspace  - this method returns a given number of values between given intervals , default is 50

y = np.linspace(1,20)
print(y,"Total : ",len(y))
z = np.linspace(1,20,10)
print(z)

# Zeros, Ones - returns array of given shape filled with zero or one respectively 
x = np.zeros([3,4])
print(x)
z = np.ones([3,3,2])
print(z)

# Full - returns array of given shape filled with give value,irrespective of datatype
print(  np.full([3,3],"Nisarg")  )

# eye - returns Identity Matrix of give shape
print( np.eye(5) )

# random numbers

print( np.random.rand(4) ) # gets random numbers from uniform distribution
print( np.random.randn(4) ) # gets 4 random numbers from normal distribution
print( np.random.randint(-10,10,5)) # gets 5 random integers between -10 and 10
print( np.random.randint(-10,10,size=(3,4))) # gets a 3*4 matrix of random integers between -10  and 10
print( np.random.randn(3,4) ) 
print( np.random.choice([9, 3, 7, 5], size=(3, 5)) ) 



