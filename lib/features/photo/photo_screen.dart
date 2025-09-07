import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jignasa_album_practical/constants/image_constants.dart';

final likedProvider = StateProvider.family<bool, String>((ref, photoId) => false);

class PhotoScreen extends ConsumerWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Arguments: pass photo url and name
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String photoUrl = args["url"];
    final String photoId = args["id"];
    final String photoTitle = args["title"];

    final isLiked = ref.watch(likedProvider(photoId));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Photos"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Photo
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  photoUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image, size: 100, color: Colors.white54),
                ),
              ),
            ),
          ),

          // Like Button
          Padding(
            padding: const EdgeInsets.only(bottom: 40,top:20),
            child: GestureDetector(
              onTap: () {
                ref.read(likedProvider(photoId).notifier).state = !isLiked;
              },
              child: Image.asset(
                isLiked
                    ? ImageConstants.like
                    : ImageConstants.unLike,
                width: 50,
                height: 50,
              ),
            ),
          ),

        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
