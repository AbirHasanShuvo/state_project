import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/to_do_app/item_provider.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      body: item.isEmpty
          ? Center(child: Text("The list is empty"))
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return Center(
                  child: ListTile(
                    title: Text(item[index].name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => ref
                              .read(itemProvider.notifier)
                              .deleteItem(item[index].id),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('Md. Abir Hasan');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
