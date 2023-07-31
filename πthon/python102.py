# Functions

# 1 . Arguments
'''

Objects of built-in type that are mutable are:
        Lists
        Sets
        Dictionaries
        User-Defined Classes (It purely depends upon the user to define the characteristics) 

Objects of built-in type that are immutable are:
        Numbers (Integer, Rational, Float, Decimal, Complex & Booleans)
        Strings
        Tuples
        Frozen Sets
        User-Defined Classes (It purely depends upon the user to define the characteristics)

In Python, arguments are passed by reference.
wheather the passed object is mutable or immutable , both are passed by reference 
and thus at the time of invokation of a function call , both the actual and reference
arguments points at the same location.

any change done to a mutalbe object argument in a function also reflects in the
actual argument.

and in the case of immutalbe , any attempt of changing the value of the object would
led to the creation of new object.

'''

def change_num(num):
    print("num address : " ,hex(id(num))," same as n , due to pass by reference") # same as n 
    num += 30
    print("num address : " ,hex(id(num))," new object created , as num is immutable") # a new object is created thus a diff address
n = 40
print("n address: ",hex(id(n))," ","value : ",n)
change_num(n)
print(n," no change in the value of n \n")

def change_list(l2):
    print("num address : " ,hex(id(l2))," same as l1 , due to pass by reference") # same as n 
    l2.append("Nisarg")
    print("num address : " ,hex(id(l2))," same object , as list is mutable") # a new object is created
l1 = ["this","is","Patel"]
print("l1 address: ",hex(id(n))," ","value : ",l1)
change_list(l1)
print(l1," a new object is added\n")   

# Types of Arguments
'''
1. Positional 
2. Default  -- should be last in order , it is used only when no value is passed for
               that argument. there can be multiple default arguments. put at last.
3. Variable -- should be last in order , it works by copying all values beyond that 
               position into a tuple. only one variable argument is allowed.
4. Keyword 

'''
# Positional 
def display1(flight_number, seating_capacity):
    print("Flight Number:", flight_number)
    print("Seating Capacity:", seating_capacity)

print("code-1: positional arguments")
display1("AI789",200) 

# Keyword
def display2(flight_number, seating_capacity):
    print("Flight Number:", flight_number)
    print("Seating Capacity:", seating_capacity)

print("-------------------------------------------------")
print("code-2: keyword arguments")
display2(seating_capacity=250, flight_number="AI789")

# Default
def display3(flight_number, flight_make="Boeing", seating_capacity=150,*eef):
    print("Flight Number:", flight_number)
    print("Flight Make:", flight_make)
    print("Seating Capacity:", seating_capacity)
    print("eeff : ",eef)
print("-------------------------------------------------")
print("code-3: default arguments")
display3("AI789","Eagle",3,4,5,8,9)
#display3("BA234")
#display3("SI678","Qantas",200)

# Variable argument
def display4(passenger_name, *baggage_tuple):
    print("Passenger name:",passenger_name)
    total_wt=0
    for baggage_wt in baggage_tuple:
        total_wt+=baggage_wt
    print("Total baggage weight in kg:", total_wt)

print("-------------------------------------------------")
print("code-4: variable argument count")
display4("Jack",12,8,5)

# Types of Variables
'''
1. Local 
2. Global

Global variables are created when the program execution
starts and remains in memory till the program terminates.
They can be read anywhere in the program - within a function 
or outside. But they are protected from modification inside 
a function.If any attempt to modify the global variable is 
taken place inside a certain function , a new local variable
with that name is created.

Local Variables are created when owning function starts execution 
and remains in memory till owning function finishes execution. 
They can be accessed only inside that function.

'''

# Exception Handling

'''
try{
    
    
}
except{
    
}
finally{
     A finally block of statement is an optional 
     part of the try-except statements. A code written
     inside the finally block will ALWAYS be executed.
}


Buitin Exceptions

1. ZeroDivisionError
2. TypeError  -- When we try to do an operation with incompatible data types
 eg 
    Total = 10
    Total += "20" - type Error
3. NameError -- when we try to access a variable which is not defined
eg 
  print(nisarg) # where nisarg is not defined
  
4. IndexError -- when we try to access a index value which is out of range
eg l = [3,45,6,7]
   print(l[4])  # index Error
5. Value Error -- When we use a valid data type for an argument of 
                  a built-in function but passes an invalid value for it
  Eg:
       value = "A"
       x = int("A")
       
       here string is a valid argument for function int() but the 
       value of string passed as argument is invalid.
'''

def calculate_expenditure(list_of_expenditure):
    total=0
    try:
        for expenditure in list_of_expenditure:
            total+=expenditure
        print("Total:",total)
        avg=total/num_values
        print("Average:",avg)
    except ZeroDivisionError:
        print("Divide by Zero error")
    except TypeError:
        print("Wrong data type")
    except:
        print("Some error occured")
list_of_values=[100,200,300,"400",500]
num_values=0
calculate_expenditure(list_of_values)


# CODE ORGANIZATION

'''
Code organization is done through modules and packages!

- A module is nothing but a normal python file with a .py extension.
- A package is just a normal folder which contains an empty file who's
  name is __init__.py. Since package is a folder it can store many python  
  modules/files in it.
 
 

Consider a scenario where 2 modules have the same name but in different package and both of them have the same function ‘add’.

Flights->Manage.py->add()

Employees->Manage.py->add()

To avoid naming conflicts during import we can use one of the below techniques:

1.
airline="Smart Airlines"
def add(no_of_flights):
    print(no_of_flights," flights added to the fleet")

2.  
from Flights import Manage as FManage
from Employees import Manage as EManage
FManage.add()
EManage.add()

3.
from Flights.Manage import add as add1
from Employees.Manage import add as add2
add1()
add2()

'''

# File Handling

'''

'''