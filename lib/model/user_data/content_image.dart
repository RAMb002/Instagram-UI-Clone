class ContentImage{
  final String image;
   int likes;
   bool likeStatus;
   bool bigLikeGesture;
  final String comment;
  final int totalComments;
  final String day;

  ContentImage({
    required this.image,
    required this.likes,
     this.likeStatus=false,
    this.bigLikeGesture = false,
    required this.comment,
    required this.totalComments,
    required this.day
});

}