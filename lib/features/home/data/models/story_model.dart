class StoryModel {
  final int id;
  final String title;
  final String by;
  final int score;
  final int descendants;
  final int time;
  final String? url;
  final List<dynamic>? kids;

  StoryModel({
    required this.id,
    required this.title,
    required this.by,
    required this.score,
    required this.descendants,
    required this.time,
    this.url,
    this.kids,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      by: json['by'] ?? '',
      score: json['score'] ?? 0,
      descendants: json['descendants'] ?? 0,
      time: json['time'] ?? 0,
      url: json['url'],
      kids: json['kids'],
    );
  }
}