import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/time_utils.dart';
import '../../data/models/story_model.dart';

class StoryTile extends StatelessWidget {
  final StoryModel story;
  final int index;

  const StoryTile({
    super.key,
    required this.story,
    required this.index,
  });

  String getDomain(String? url) {
    if (url == null) return '';

    try {
      final uri = Uri.parse(url);
      return uri.host.replaceFirst('www.', '');
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/detail', extra: story.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${index + 1}.',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(width: 6),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(
                        story.title,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        '(${getDomain(story.url)})',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${story.score} points by ${story.by} '
                    '${timeAgo(story.time)} | '
                    '${story.descendants} comments',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}