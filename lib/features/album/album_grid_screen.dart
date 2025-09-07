import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jignasa_album_practical/constants/route_constants.dart';
import 'package:jignasa_album_practical/constants/text_constants.dart';
import 'package:jignasa_album_practical/features/album/album_provider.dart';

class AlbumGridScreen extends ConsumerWidget {

  const AlbumGridScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    final String eventId = args["id"];
    final String eventName = args["name"];

    final albumAsync = ref.watch(albumProvider(eventId));

    return Scaffold(
      appBar: AppBar(title: Text(eventName), centerTitle: true),
      body: albumAsync.when(
        data: (albums) {
          if (albums.isEmpty) {
            return const Center(child: Text(TextConstants.noPhotosFound));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, // 2 images per row
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteConstants.photo,
                    arguments: {
                      "url": album.photoUrl,
                      "title": album.eventId,
                      "id":album.id
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(album.photoUrl, fit: BoxFit.cover),
                ),
              );
            },
          );
        },
        error: (e, _) => Center(child: Text("${TextConstants.error} $e}")),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
