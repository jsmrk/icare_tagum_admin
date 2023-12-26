class UpdateDetails {
  final String title;
  final String authorName;
  final String description;
  final List<dynamic>? imageURLs;
  final DateTime dateTime;

  UpdateDetails({
    required this.title,
    required this.authorName,
    required this.description,
    required this.imageURLs,
    required this.dateTime,
  });
}
