import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/story_model.dart';

class HomeRepository {
  Future<List<int>> fetchTopStoryIds() async {
    final response = await dio.get(ApiConstants.topStories);

    return List<int>.from(response.data);
  }

  Future<StoryModel> fetchStory(int id) async {
    final response = await dio.get(ApiConstants.item(id));

    return StoryModel.fromJson(response.data);
  }
}