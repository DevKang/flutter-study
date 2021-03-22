// Iterable<int> naturalsTo(int n) sync* {
//   int k = 0;
//   while (k < n) yield k++;
// }

// void main()
// {
//   print(naturalsTo(10));
  
// }

// Iterable<int> range(int num) sync* {
//   while (num > 0) {
//     yield --num;
//   }
// }

// void main() {
//   for (int value in range(10)) {
//     print(value);
//   }
// }

// Stream<int> range(int num) async* {
//   while (num > 0) {
//     yield --num;
//   }
// }

// void main() async {
//   range(10).listen((value) => print(value));
  
  
// }

// Iterable<int> range(int num) sync* {
//   while (num > 0)
//   {
//     yield --num;
//   }
// }

// void main()
// {
//   print("start");
//   for (int value in range(10))
//   {
//     print(value);
//   }
//   print("end");
// }

// Stream<int> range(int num) async*
// {
//   while (num > 0)
//     yield --num;
// }

// void main()
// {
//   print("start");
//   range(10).listen((value) => print(value));
//   print("end");
// }