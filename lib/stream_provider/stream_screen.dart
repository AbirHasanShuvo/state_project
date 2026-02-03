import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/stream_provider/stream_provider.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamProvider = ref.watch(stockPriceProvider);
    return Scaffold(
      body: Center(
        child: streamProvider.when(
          data: (stream) =>
              Text(stream.toStringAsFixed(2), style: TextStyle(fontSize: 35)),
          error: (error, stack) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
