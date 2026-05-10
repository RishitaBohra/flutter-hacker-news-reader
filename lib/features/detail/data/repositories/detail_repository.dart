import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../home/data/models/story_model.dart';
import '../models/comment_model.dart';

class DetailRepository {
  Future<StoryModel> fetchStory(int id) async {
    final response = await dio.get(ApiConstants.item(id));

    return StoryModel.fromJson(response.data);
  }

  Future<CommentModel> fetchComment(int id) async {
    final response = await dio.get(ApiConstants.item(id));

    return CommentModel.fromJson(response.data);
  }
}