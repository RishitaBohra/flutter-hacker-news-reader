import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/data/models/story_model.dart';
import '../../data/models/comment_model.dart';
import '../../data/repositories/detail_repository.dart';

final detailRepositoryProvider =
    Provider<DetailRepository>((ref) {
  return DetailRepository();
});

final storyDetailProvider =
    FutureProvider.family<StoryModel, int>((ref, id) async {
  final repository = ref.read(detailRepositoryProvider);

  return repository.fetchStory(id);
});

final commentsProvider =
    FutureProvider.family<List<CommentModel>, List<dynamic>>(
  (ref, ids) async {
    final repository = ref.read(detailRepositoryProvider);

    final comments = await Future.wait(
      ids.map((id) => repository.fetchComment(id)),
    );

    return comments;
  },
);