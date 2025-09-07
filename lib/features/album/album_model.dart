class Album {
  final String id;
  final String eventId;
  final String photoUrl;

  Album({
    required this.id,
    required this.eventId,
    required this.photoUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      photoUrl: json['photoUrl'] as String,
    );
  }
}
