import 'package:instagram_clone/model/user_data/content_image.dart';

class ReelData extends ContentImage {

    final String name;
    final String imageUrl;
    bool followingStatus;
  ReelData(
      {super.bigLikeGesture,
      super.likeStatus,
      required super.image,
      required super.totalComments,
      required super.day,
      required super.likes,
      required super.comment,
      required this.name,
      required this.imageUrl,
      this.followingStatus=false,
      });
}
