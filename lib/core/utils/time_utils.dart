String timeAgo(int unixTime) {
  final date =
      DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);

  final difference = DateTime.now().difference(date);

  if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else {
    return '${difference.inDays} days ago';
  }
}