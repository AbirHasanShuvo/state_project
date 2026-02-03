// void main() {
//   Person person = Person(name: 'Abir Hasan', age: 27);
//   print(person.name);
//   print(person.age);
//
//   //now i am gonna change the value
//   person = person.copyWith(name: "Hasan Shuvo");
//   print(person.name);
//   print(person.age);
//
//   //normally it is not possible to change the final value. but with copywith its possible
//
//
// }
//
// class Person {
//   final String name;
//   final int age;
//
//   Person({required this.name, required this.age});
//
//   Person copyWith({String? name, int? age}) {
//     return Person(name: name ?? this.name, age: age ?? this.age);
//   }
// }
//
// //in the above code is for the copyWith Method
//
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/dynamic_crud/presentation/product_screen.dart';
import 'package:state_project/future_provider/future_screen.dart';
import 'package:state_project/home_screen.dart';
import 'package:state_project/state_notifier/search_screen.dart';
import 'package:state_project/state_provider.dart';
import 'package:state_project/stream_provider/stream_screen.dart';
import 'package:state_project/to_do_app/item_screen.dart';

import 'multi_state/slider_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamScreen(),
      ),
    );
  }
}

