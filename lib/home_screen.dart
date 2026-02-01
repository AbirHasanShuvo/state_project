import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = Provider<String>((ref) {
  return 'Subscribe to my channel';
});
final age = Provider<int>((ref) {
  return 27;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subscribe = ref.watch(hello);

    return Scaffold(
      body: Center(child: Text(subscribe, style: TextStyle(fontSize: 30))),
    );
  }
}
