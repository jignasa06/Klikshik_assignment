import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'events_model.dart';
import 'events_repository.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository(client: http.Client());
});

final eventsProvider = FutureProvider<List<EventModel>>((ref) async {
  final repo = ref.watch(eventRepositoryProvider);
  return repo.fetchEvents();
});
