class ChecklistItem {
  final String id;
  final String label;
  final String description;
  // final List<Image> imageList;

  const ChecklistItem({
    required this.id,
    required this.label,
    this.description = "",
    // this.imageList = ,
  });
}
