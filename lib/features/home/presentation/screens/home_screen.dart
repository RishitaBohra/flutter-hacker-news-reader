import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/home_provider.dart';
import '../widgets/story_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesAsync = ref.watch(topStoriesProvider);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  'Y',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            const Text(
              'Hacker News',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: const Text(
      'new | past | comments | ask | show | jobs | submit',
      style: TextStyle(
        fontSize: 12,
      ),
    ),
  ),
),
          ],
        ),
      ),

      body: storiesAsync.when(
        data: (stories) {
          return RefreshIndicator(
  onRefresh: () async {
    ref.refresh(topStoriesProvider);
  },
  child: ListView.builder(
    itemCount: stories.length,
    itemBuilder: (context, index) {
      return StoryTile(
        story: stories[index],
        index: index,
      );
    },
  ),
);
        },

        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

        error: (error, stack) {
          return Center(
            child: Text(error.toString()),
          );
        },
      ),
    );
  }
}