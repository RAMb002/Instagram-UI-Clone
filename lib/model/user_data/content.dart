class Content {
  final String imageUrl;
  final String name;
  final String message;
  final String time;
  final String subMessage;
  final bool status;
  final int followers;
  final int following;
  final String description;

  Content(
      {required this.imageUrl,
      required this.name,
      required this.message,
      required this.time,
      required this.status,
      required this.subMessage,
      required this.followers,
      required this.following,
      this.description = "Keep fighting no matter what"
      });
}
