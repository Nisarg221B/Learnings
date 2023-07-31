'''
Classes and Objects
'''
print("\n --- Classes and Objects\n")
class Mobile:
    pass
# referance_variable = object_created
mob1 = Mobile()
mob2 = Mobile()
mob3 = Mobile()

print(id(mob1),id(mob2))

# to create attributes and value for those attributes

# reference_variable.attribute = value

'''

In python, we can create attributes for a specific object alone. 
In the below example, the mob1 object has an ios version which mob2 does not have.

'''
mob1.price = 30000
mob1.brand = "Apple"
mob1.ios_version = "iOS-16"

mob2.price = 3000
mob2.brand = "samsung"

print(mob1.brand,mob1.ios_version)
print(mob2.brand)
print("\n --- Common Attributes\n")
'''
Common Attributes

Attributes can be added to a class through a special function called __init__().

"self" is not a keyword it can be named anything . self refers to the current object being executed.

Methods can be created inside the class , but such functions should have a special
parameter called self as first paramenter.
'''

class person:
    def __init__(self,name,age,height):
        print("\ninside constructor")
        print("self id: ",id(self))
        self.name = name
        self.age = age
        self.height = height
    def purchase(this): # this -- self
        print("purchasing a Castle for",this.name)
    def __str__(self):
        return "This is "+self.name
    
per1 = person("nisarg",18,160)
print(id(per1))

per2 = person("payal",20,170)
print(id(per1))

print("per1: ",per1.age,per1.height)
print("per2: ",per2.age,per2.height)
# per3 = person() -- will result in error as it requires 2 positional arguments

per1.purchase()
per2.purchase()
per3 = person("Indicate",32,444)
person.purchase(per3)

print("\n --- multiple reference variables\n")
'''
an object can also have multiple reference variables. 
Both the references are referring to the same object. 
When you assign an already created object to a variable, 
a new object is not created.
'''

per4 = per3 # both the reference variables are pointing to the same object
print("id of per3",id(per3),"==","id of per4",id(per4))
print(per1)

print("\n --- Private Attributes\n")
'''
Attributes are made private by adding a double underscore in front of it.
Private attributes are those which are accessible only inside the class.

'''

class Customer:
    def __init__(self, cust_id, name, age, wallet_balance):
        self.cust_id = cust_id
        self.name = name
        self.age = age
        self.__wallet_balance = wallet_balance # private attribute

    def update_balance(self, amount):
        if amount < 1000 and amount > 0:
            self.__wallet_balance += amount

    def show_balance(self):
        print ("The balance is ",self.__wallet_balance)

'''
If we try to assign a value to a private variable, 
we end up creating a new attribute in python.
'''
c1=Customer(100, "Gopal", 24, 1000)

# print(c1.__wallet_balance) # -- will get an error
# c1.show_balance()

# c1.__wallet_balance = 10000000000 #-- will produce new attribute name __wallet_balance

c1.show_balance()
# print(c1.__wallet_balance)
print(c1._Customer__wallet_balance) # to access private variable , _classname__variable
# to update private variable outside the class
c1._Customer__wallet_balance = 2000 # not advisable
print(c1._Customer__wallet_balance)

print("\n --- PASS BY REFERENCE\n")
'''
PASS BY REFERENCE
'''
class Example:
    def __init__(self,num):
        self.num=num

    def set_num(self,num):
        self.num=num

    def get_num(self):
        return self.num

def change_num(ex): # ex - function paramenter ,ex will become a reference variable for the object obj
    ex.num = 30
obj=Example(10)
print(obj.get_num())
change_num(obj) # passing object to funciton parameter ex i.e. ex = obj
print(obj.get_num())

# we pass an object to a parameter, the parameter name becomes a reference variable

print("\n --- Collection of Objects\n")
'''
Collection of Objects
'''
class mobile:
    discount = 50 # Static Variable 
    __Version = "IOS-16" # private static variable
    def __init__(self, price, brand):
        self.price = price
        self.brand = brand
        
    def display(self):
        print(self.discount)
         #The above line is valid way of accessing static 
        print(mobile.discount)

    def change(self):
        self.discount=40
        #The above line creates a new attribute
        #instead of modifying the static value
        #Now there are two discount variables,
        #one at class level and the other at object level
        #Hence best is to access Static through class name

    def purchase(self):
        total = self.price - self.price * mobile.discount / 100
        print ("Total is ",total)

    @staticmethod # static mehtods don't require any argument for object reference(self) as they are class level methods
    def get_discount():
        return mobile.discount

    @staticmethod
    def set_discount(discount):
        mobile.discount = discount

mob1=mobile("Apple", 1000)
mob2=mobile("Samsung", 2000)
mob3=mobile("Apple", 3000)
mob4=mobile("Samsung", 4000)
mob5=mobile("Apple", 5000)

print("storing in list")
list = ["mob"+str(i) for i in range(1,6)]
for l in list:
    x = eval(l) # string to python obj conversion
    print(x.brand,x.price,end = " | ")

print("\nstoring in Dictionary")
dic = {"m"+str(i) : eval(list[i]) for i in range(0,5)}

for key,value in dic.items():
    print(value.brand,value.price,end= " ^ ")
print()

print("\n --- Static Variables and Methods\n")
'''
Static Variables and Methods

The static variables are shared by all objects, 
not owned by each object. Thus, by 
making a single change, it should 
reflect in all objects at one go.

We can create shared attributes by placing them 
directly inside the class and not inside the constructor. 

And since this attribute is not owned by any one object, 
we don't need the self to create this attribute.

if self or the object is used to update the static variable 
a new attribute of the same name as static variable will
get created for that object. and original static variable 
won't get effected , as it cannot be accessed via reference variable.

Static attributes are accessed using ClassName

There are two rules in creating static methods:
      --    The methods should not have self
      --    @staticmethod must be written on top of it

'''

m1=mobile(3000,"Apple")
m1.display()#Will display 50 and 50

m1.change()
m1.display()#Will display 40 and 50

print(m1.discount)
m1.discount = 40
print(m1.discount)
print(mobile.discount)


print("\n --- Inheritance\n")
'''
        Inheritance
        
To create an inheritance relationship between the classes, 
mention the name of the parent class in brackets.

a child class inherits:

       -- Constructor
       -- Non Private Attributes
       -- Non Private Methods

if the child class has its own constructor , the consturctor of the parent 
class is not inherited , hence the attributes of the parent class are also
not inherited in such case.

therefore for such case we can use the super to access the parent class
constructor.
Thus, the data is passed to the child class constructor, from there 
the data is sent to the parent class constructor and thus the attributes 
of the parent class get inherited.

super() function can be used to access the constructor or methods 
of the parent class, but not the attributes.
'''

class Phone:
    def __init__(self, price, brand, camera):
        self.price = price
        self.brand = brand
        self.camera = camera

    def buy(self):
        print ("Buying a phone")

    def return_phone(self):
        print ("Returning a phone")

class FeaturePhone(Phone): # constructor of the parent class is inherited
    pass

class SmartPhone(Phone):
    pass

FeaturePhone(10000,"Apple","13px").buy()
print()
# super use 
class Phone:
    def __init__(self, price, brand, camera):
        print ("Inside phone constructor")
        self.__price = price
        self.brand = brand
        self.camera = camera

    def buy(self):
        print ("Buying a phone")

    def return_phone(self):
        print ("Returning a phone")

class FeaturePhone(Phone):
    pass

class SmartPhone(Phone):
    def __init__(self, price, brand, camera, os, ram):
        super().__init__(price, brand, camera) # accessing the parent class constructor
        self.os = os
        self.ram = ram
        print ("Inside smartphone constructor")

    def buy(self):  
        print ("Buying a smartphone")
        super().buy() # invoking the overriden method buy in parent class

s=SmartPhone(20000, "Samsung", 12, "Android", 2)

print(s.os)
print(s.brand)
s.buy()

# Multiple Inheritance 
'''
When a child is inheriting from multiple parents,
and if there is a common behavior to be inherited, 
it inherits the method in Parent class which is 
first in the list. In our example, the buy() of 
Product is inherited as it appears first in the list.
'''
class Phone:
    def __init__(self, price, brand, camera):
        print ("Inside phone constructor")
        self.__price = price
        self.brand = brand
        self.camera = camera

    def buy(self):
        print ("Buying a phone")

    def return_phone(self):
        print ("Returning a phone")

class Product:
    def buy(self):
        print ("Product buy method")

class SmartPhone(Product, Phone):
    pass

s=SmartPhone(20000, "Apple", 12)

s.buy() # this buy method should be of product class as it is inherited first
