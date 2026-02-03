class Item {
  final String id;
  final String name;
  final bool favourite;

  Item({required this.id, required this.name, required this.favourite});

  Item copyWith({String? id, String? name, bool? favourite}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      favourite: favourite ?? this.favourite,
    );
  }
}
