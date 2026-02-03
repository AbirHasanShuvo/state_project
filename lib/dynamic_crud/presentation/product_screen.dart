import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/dynamic_crud/providers/favourite_provider.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic CRUD'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(favouriteProvider.notifier).favourite(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "All", child: Text('All')),
                PopupMenuItem(value: "Favourite", child: Text('Favourite')),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(favouriteProvider.notifier).filterList(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favouriteList.filteredItems.length,
              itemBuilder: (context, index) {
                final item = favouriteList.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: item.favourite
                      ? Icon(Icons.favorite_outlined)
                      : Icon(Icons.favorite_outline),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
