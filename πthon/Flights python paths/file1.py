'''
Consider a scenario where 2 modules have the same name but in different package and both of them have the same function ‘add’.

Flights->Manage.py->add()

Employees->Manage.py->add()

To avoid naming conflicts during import we can use one of the below techniques:

airline="Smart Airlines"
def add(no_of_flights):
    print(no_of_flights," flights added to the fleet")
    
from Flights import Manage as FManage
from Employees import Manage as EManage
FManage.add()
EManage.add()

from Flights.Manage import add as add1
from Employees.Manage import add as add2
add1()
add2()

'''