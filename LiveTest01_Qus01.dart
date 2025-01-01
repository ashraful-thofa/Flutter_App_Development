import 'dart:io';

main() {

  print("Please enter the height of the Triangle:\n");


  double? x=double.tryParse(stdin.readLineSync()!);

  print("Please enter the base of the Triangle:\n");

  double? y=double.tryParse(stdin.readLineSync()!); 

  print("Triangle area: ${triangle(x!,y!)}");
}


double triangle(base, height) {
  return 0.5 * base * height;
}