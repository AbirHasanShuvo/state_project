import 'package:flutter_riverpod/legacy.dart';
import 'package:state_project/dynamic_crud/model/item.dart';
import 'package:state_project/dynamic_crud/providers/favourite_states.dart';

final favouriteProvider = StateNotifierProvider((ref) {
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteStates> {
  FavouriteNotifier()
    : super(
        FavouriteStates(
          search: '',
          allItems: [],
          filteredItems: [],
          favourite: 'All',
        ),
      );

  void addItem() {
    List<Item> items = [
      Item(
        name: "Macbook air m4",
        id: DateTime.now().toString(),
        favourite: true,
      ),
      Item(
        name: "iPhone 16 pro",
        id: DateTime.now().toString(),
        favourite: true,
      ),
      Item(
        name: "Hoco headphone",
        id: DateTime.now().toString(),
        favourite: false,
      ),
      Item(
        name: "DJI action 5 pro",
        id: DateTime.now().toString(),
        favourite: true,
      ),
      Item(
        name: "Salnotes Zero 2 IEM",
        id: DateTime.now().toString(),
        favourite: true,
      ),
      Item(
        name: "Huawei Router",
        id: DateTime.now().toString(),
        favourite: false,
      ),
      Item(
        name: "Yamaha fzs v3 deluxe",
        id: DateTime.now().toString(),
        favourite: true,
      ),
      Item(
        name: "Anker zolo 20 watt",
        id: DateTime.now().toString(),
        favourite: true,
      ),
      Item(
        name: "Javeline jm11",
        id: DateTime.now().toString(),
        favourite: true,
      ),
    ];

    state = state.copyWith(
      allItems: items.toList(),
      filteredItems: items.toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(
      filteredItems: _filteredItems(state.allItems, search),
    );
  }

  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItem(state.allItems, option),
    );
  }

  List<Item> _favouriteItem(List<Item> items, String option) {
    if (option == "All") {
      return items;
    }

    return items.where((item) => item.favourite == true).toList();
  }

  List<Item> _filteredItems(List<Item> items, String query) {
    if (query.isEmpty) {
      return items;
    }

    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
