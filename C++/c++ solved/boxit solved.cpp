//
//  boxit solved.cpp
//  C++ learning
//
//  Created by Nisarg on 19/06/20.
//  Copyright © 2020 Nisarg. All rights reserved.
//

#include <stdio.h>
class Box {
private:
int length, breadth, height;
public:
Box() {
length = 0;
breadth = 0;
height = 0;
}
Box(int l, int b, int h) {
length = l;
breadth = b;
height = h;
}
Box(const Box &B) {
length = B.length;
breadth = B.breadth;
height = B.height;
}
int getLength() {
return length;
}
int getBreadth() {
return breadth;
}
int getHeight() {
return height;
}
long long CalculateVolume() {
return (long long)(breadth) * length * height;
}
bool operator<(Box &B) {
if (length < B.length) {
return true;
} else if (length == B.length) {
if (breadth < B.breadth) {
return true;
} else if (breadth == B.breadth) {
if (height < B.height) {
return true;
}
}
}

return false;
}
};
ostream &operator<<(ostream &out, Box &B) {
out << B.getLength() << " " << B.getBreadth() << " " << B.getHeight();
return out;
};
