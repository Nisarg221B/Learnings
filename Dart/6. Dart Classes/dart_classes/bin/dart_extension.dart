//in somecases ,few classes by default are not extendable 
// so there we can use extension  to add methods and feild to them 
// for furthur funcitonality

extension IntegerExtenstion on int {
  int get lukyInteger => 12;
  int add15() => this + 15;
}

void main() {
  print('1.luckyInteger --> ${1.lukyInteger}');
  print('10.add15() --> ${10.add15()}');
}
