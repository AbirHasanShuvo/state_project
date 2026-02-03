import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<List<String>>((ref)async{
  await Future.delayed(const Duration(seconds: 3));
  return [
    'Abir',
    'Rafi',
    'Saroar',
    'Rakib',
    'Rabbani',
    'Shamsur',
    'NH Ashiq',
    'Abdullah',
    'Nihal'
  ];
});

