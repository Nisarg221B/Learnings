import matplotlib.pyplot as plt
import numpy as np
import matplotlib 

'''

Following are the various approaches to plotting in Matplotlib:

MATLAB way of plotting using matplotlib.plyplot. It is simple to use
Object-Oriented way of plotting for more control and customization

'''
x = np.array([9,4,5,6,7])
y = x**2
print(x,y)
# plt.plot(x,y)
# plt.show()

X=np.array([1,2,3,4,5])
Y=X**2
print(X,Y)
# plt.plot(X,Y)
# plt.show()

# Using Object Oriented 
x = np.arange(1,16)
y = x**2
z = (y/4)*x

# step 1

fig = plt.figure()

# step 2

ax = fig.add_axes([0,0,1,1])
ax2 = ax.twinx()

# step 3
ax.plot(x,y,color='g',label='he he')
ax2.plot(z,y,color='k',label='ax2')
ax.plot(x,z,color='r',label='df')

ax3 = fig.add_axes([0.1,0,1,0.35])
ax3.plot(z,y,color='b',label='ax3')
ax3.set_title("title for axes 3")
ax3.set_xlabel("z ----> ")
ax3.set_ylabel("y ----> ")

plt.show()


