import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/text_constants.dart';
import 'album_model.dart';

class AlbumRepository {
  final http.Client client;

  AlbumRepository({required this.client});

  Future<List<Album>> fetchAlbumByEvent(String eventId) async {
    final url = Uri.parse(
      "https://68bd7d35227c48698f84a196.mockapi.io/events/$eventId/albums",
    );
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception(TextConstants.loadAlbumError);
    }
  }
}
