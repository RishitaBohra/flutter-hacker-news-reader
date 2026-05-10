class ApiConstants {
  static const String baseUrl =
      'https://hacker-news.firebaseio.com/v0';

  static const String topStories =
      '$baseUrl/topstories.json';

  static String item(int id) =>
      '$baseUrl/item/$id.json';
}