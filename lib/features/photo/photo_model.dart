class PhotoModel {
  final String url;
  bool isLiked;

  PhotoModel({
    required this.url,
    this.isLiked = false,
  });

  void toggleLike() {
    isLiked = !isLiked;
  }
}
