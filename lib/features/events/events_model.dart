class EventModel {
  final String id;
  final String name;
  final String thumbnailUrl;

  EventModel({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
