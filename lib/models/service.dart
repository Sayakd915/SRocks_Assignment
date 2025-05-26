class Service {
  final String iconUrl;
  final String backgroundUrl;
  final String title;
  final String description;

  Service({
    required this.iconUrl,
    required this.backgroundUrl,
    required this.title,
    required this.description,
  });

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      iconUrl: map['iconUrl'] ?? '',
      backgroundUrl: map['backgroundUrl'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }
}