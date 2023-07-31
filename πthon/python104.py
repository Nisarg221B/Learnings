# iterators , iterable , itertools 

'''
for x in something : 
    # code and stuff

    this something is iterable 

'''

l = ['cx32', 'gsof' , 'emily' , 'franz', 'rex']

for element in l :
    print(element)
'''
here the list is iterable

list is one type of sequence = Iterable + ordered

other common sequences : lists, tuples , strings , bytes
'''

for element in ('jose','ho', 'dg'):
    print(element)

for letter in 'nisarg':
    print(letter)
'''
in below code it is shown that digits are not iterable by default

for digit in 299343:
    print(digit)
'''

'''
in collections.abc ( abstract base classes ) 
we have 
                                            Abstract Methods
1. Iterable                                 _iter_
2. Iterator  - inherites from iterable      _next_

container.__iter__()
    Returns an iterator object
container.__next__()
    Returns the next item from the container.
    if there are no further items,
    raise the StopIteration exception
'''
print("\n\n\nEmitating for loop")
# Lets emitate a for loop using iter and next 

usernames = ('nisarg','payal','nishant','nikhil','nikshan','yashi')
looper1 = usernames.__iter__()    # iter(usernames)
print(type(looper1)) # tuple iterator 

print(looper1.__next__()) # next(looper1)
print(looper1.__next__())
print(looper1.__next__())
# print(looper1.__next__()) # this will result in error StopIteration


# python has inbuilt functions to spare us from using underscores 

looper2 = iter(usernames)

while True:
    try:
        user = next(looper2)
        print(user,end=" ")
    except StopIteration:
        print()
        break

'''
the above code is same as

for user in usernames:
    print(user,end=" ")

'''

print('\n\n\nClass with iteration built in \n')

class protfolio:
    def __init__(self) -> None:
        self.holdings = {} # key = ticker , value = number of shares

    def buy(self, ticker, shares):
                                # if its first time buying the shares defualt will be zero
        self.holdings[ticker] = self.holdings.get(ticker,0) + shares
    def sell(self,ticker,shares):
        self.holdings[ticker] = self.holdings.get(ticker,0) - shares

    def __iter__(self):
        # we will return the iterator object of the dictionary as it is already iterable
        return iter(self.holdings.items()) 

p = protfolio()
p.buy('Alpha', 32)
p.buy('beta',334)
p.buy('Adani', 99)
p.buy('zomato', 14)

for (ticker,shares) in p:
    print(ticker, " " , shares)


print('\n\nitertools\n')

'''
itertools is the library containig itrator funcitons for various tasks

1. Infinite iterators:
    a. count()   -- count(10,2) - 10 12 14 16 .. 
    b. cycle()   -- cycle('abcd') - a b c d a b c d a b c d.. 
    c. repeat()  -- repeat(12,6) - repeate 12 , 6 times - 12 12 12 12 12 12
2. combinatoric iterartos:
    'ABCD' , 2
    a. product() cartesian product   - AA AB AC AD BA BB BC BD CA CB CC CD DA DB DC DD
    b. permutations() - AB AC AD BA BC BD CA CB CD DA DB DC
    c. combinations() - AB AC AD BC BD CD
'''
