import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //using this consumer it will update only the child
          Consumer(
            builder: (context, ref, child) {
              print('build 2');
              final count = ref.watch(counter);
              return Text(count.toString(), style: TextStyle(fontSize: 52));
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              print('build 3');
              final switchValue = ref.watch(switchProvider);
              return Switch(
                value: switchValue,
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                },
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state++;
                  //that's how i am updating the state of it
                },
                child: Text("+", style: TextStyle(fontSize: 50)),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(counter.notifier).state--;
                },
                child: Text("-", style: TextStyle(fontSize: 50)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
