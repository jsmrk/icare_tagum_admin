class ConcernDetails {
  final DateTime dateTime;
  final String urgency;
  final String status;
  final String department;
  final String description;
  final String location;
  final String title;
  final String nickname;
  final List<dynamic>? imageURLs;

  ConcernDetails({
    required this.nickname,
    required this.location,
    required this.title,
    required this.dateTime,
    required this.description,
    required this.urgency,
    required this.status,
    required this.department,
    required this.imageURLs,
  });
}
