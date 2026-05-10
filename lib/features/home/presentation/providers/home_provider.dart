import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/story_model.dart';
import '../../data/repositories/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

final topStoriesProvider = FutureProvider<List<StoryModel>>((ref) async {
  final repository = ref.read(homeRepositoryProvider);

  final ids = await repository.fetchTopStoryIds();

  final limitedIds = ids.take(30).toList();

  final stories = await Future.wait(
    limitedIds.map((id) => repository.fetchStory(id)),
  );

  return stories;
});