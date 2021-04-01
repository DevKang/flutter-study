// class Person {
//   var name;
//   var age;

//   Person(this.name, this.age);
// }

// class American extends Person {
//   final String nationality;

//   American(this.nationality, String name, int age) : super(name, age);
// }

// class Asian extends American {
//   Asian(String nationality, String name, int age)
//       : super(nationality, name, age);
// }

// main() {
//   American person1 = American("United States", "MJ", 32);
//   Asian person2 = Asian("South Korea", "TS", 36);

//   print(person1.nationality);
//   print(person1.name);
//   print(person1.age);

//   print(person2.nationality);
//   print(person2.name);
//   print(person2.age);
// }

// class Person {
//   var name;
//   var age;

//   Person(this.name, this.age);

//   String sayHello() {
//     return "Hi";
//   }
// }

// class American implements Person {
//   var name;
//   var age;

//   @override
//   String sayHello() {
//     return ("Hello World");
//   }

//   American(this.name, this.age);
// }

// main() {
//   American person1 = American("MJ", "32");

//   print(person1.name);
//   print(person1.age);
//   print(person1.sayHello());
// }

abstract class vehicle {
  int accelerate(int power);

  int stop() {
    return (0);
  }
}

class Car with vehicle {
  @override
  int accelerate(int power) {
    return (power * 3);
  }
}

class Bicycle with vehicle {
  @override
  int accelerate(int power) {
    return (power * 2);
  }
}

void main() {}
