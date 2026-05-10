import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/time_utils.dart';
import '../providers/detail_provider.dart';
import '../widgets/comment_widget.dart';

class DetailScreen extends ConsumerWidget {
  final int storyId;

  const DetailScreen({
    super.key,
    required this.storyId,
  });

  Future<void> openUrl(String? url) async {
    if (url == null) return;

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyAsync =
        ref.watch(storyDetailProvider(storyId));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comments',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: storyAsync.when(
        data: (story) {
          final commentsAsync =
              ref.watch(
            commentsProvider(story.kids ?? []),
          );

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    story.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    '${story.score} points by ${story.by} '
                    '${timeAgo(story.time)}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 14),

                  if (story.url != null)
                    ElevatedButton(
                      onPressed: () => openUrl(story.url),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFFF6600),
                      ),
                      child: const Text(
                        'Open Article',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  Text(
                    '${story.descendants} Comments',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  commentsAsync.when(
                    data: (comments) {
                      return Column(
                        children: comments.map((comment) {
                          return CommentWidget(
                            comment: comment,
                          );
                        }).toList(),
                      );
                    },

                    loading: () {
                      return const Center(
                        child:
                            CircularProgressIndicator(),
                      );
                    },

                    error: (e, _) {
                      return Text(e.toString());
                    },
                  ),
                ],
              ),
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