class UpdateDetails {
  final String title;
  final String description;
  final List<dynamic>? imageURLs;
  final DateTime dateTime;

  UpdateDetails({
    required this.title,
    required this.description,
    required this.imageURLs,
    required this.dateTime,
  });
}
