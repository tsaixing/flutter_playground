class Category {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  const Category({
    required this.id,
    required this.title,
    this.description = "",
    this.imageUrl = "",
  });
}
