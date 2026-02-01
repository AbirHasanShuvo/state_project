import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return 'Subscribe to my channel';
});
final age = Provider<int>((ref) {
  return 27;
});

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final subscribe = ref.watch(hello);
//     final temp = ref.watch(age);
//     return Scaffold(
//       body: Center(child: Text(subscribe, style: TextStyle(fontSize: 30))),
//     );
//   }
// }

//using it with stateful widget

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final subscribe = ref.watch(hello);
    final temp = ref.watch(age);
    return Scaffold(
      body: Center(child: Text(subscribe +" "+ temp.toString(), style: TextStyle(fontSize: 30))),
    );
  }
}
