import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/text_constants.dart';
import 'events_model.dart';


class EventRepository {
  final http.Client client;

  EventRepository({required this.client});

  Future<List<EventModel>> fetchEvents() async {
    final url = Uri.parse("https://68bd7d35227c48698f84a196.mockapi.io/events");
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => EventModel.fromJson(json)).toList();
    } else {
      throw Exception(TextConstants.loadEventError);
    }
  }
}
