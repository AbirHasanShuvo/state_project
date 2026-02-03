import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/future_provider/future_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: provider.when(
          data: (data)=> ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index){
                return Center(child: Text(data[index], style: TextStyle(fontSize: 30),));
          }),
          error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
