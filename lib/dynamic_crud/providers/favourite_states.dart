import 'package:state_project/dynamic_crud/model/item.dart';

class FavouriteStates {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String search;

  FavouriteStates({
    required this.search,
    required this.allItems,
    required this.filteredItems,
  });

  FavouriteStates copyWith({
    List<Item>? allItems,
    List<Item>? filteredItems,
    String? search,
  }) {
    return FavouriteStates(
      search: search ?? this.search,
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }
}
