class PixabayModel {
  final int id, views, downloads, comments, likes, userId;
  final String largeImageURL, userImageURL, user, tags;

  PixabayModel({
    required this.id,
    required this.views,
    required this.downloads,
    required this.comments,
    required this.likes,
    required this.userImageURL,
    required this.largeImageURL,
    required this.user,
    required this.userId,
    required this.tags,
  });

  factory PixabayModel.fromJson(Map map) => PixabayModel(
        id: map['id'],
        views: map['views'],
        downloads: map['downloads'],
        comments: map['comments'],
        likes: map['likes'],
        userImageURL: map['userImageURL'],
        largeImageURL: map['largeImageURL'],
        user: map['user'],
        userId: map['user_id'],
        tags: map['tags'],
      );
}
