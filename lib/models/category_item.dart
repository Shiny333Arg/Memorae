class CategoryItem {
  CategoryItem({
    required this.id,
    required this.name,
    this.types = const [],
  });

  final int id;
  final String name;
  final List<String> types;
}
