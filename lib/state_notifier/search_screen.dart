import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/state_notifier/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),

          const SizedBox(height: 10),

          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchProvider);
              return Text(search.search);
            },
          ),

          Consumer(
            builder: (context, ref, child) {
              final isChange = ref.watch(
                searchProvider.select((state) => state.isChanged),
              );
              return Switch(
                value: isChange,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).isChange(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
