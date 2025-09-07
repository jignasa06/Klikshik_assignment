import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jignasa_album_practical/features/album/album_repository.dart';
import 'package:http/http.dart' as http;
import 'album_model.dart';

final albumRepositoryProvider = Provider<AlbumRepository>((ref) {
  return AlbumRepository(client: http.Client());
});

final albumProvider = FutureProvider.family<List<Album>, String>((
  ref,
  eventId,
) async {
  final repo = ref.watch(albumRepositoryProvider);
  return repo.fetchAlbumByEvent(eventId);
});
