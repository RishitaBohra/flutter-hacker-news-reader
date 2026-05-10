class CommentModel {
  final int id;
  final String by;
  final String text;
  final int time;
  final List<dynamic>? kids;
  final bool deleted;
  final bool dead;

  CommentModel({
    required this.id,
    required this.by,
    required this.text,
    required this.time,
    this.kids,
    required this.deleted,
    required this.dead,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ?? 0,
      by: json['by'] ?? 'unknown',
      text: json['text'] ?? '',
      time: json['time'] ?? 0,
      kids: json['kids'],
      deleted: json['deleted'] == true,
dead: json['dead'] == true,
    );
  }
}