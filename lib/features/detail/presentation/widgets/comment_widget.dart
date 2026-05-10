import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/html_utils.dart';
import '../../../../core/utils/time_utils.dart';
import '../../data/models/comment_model.dart';
import '../providers/detail_provider.dart';

class CommentWidget extends ConsumerWidget {
  final CommentModel comment;
  final int depth;

  const CommentWidget({
    super.key,
    required this.comment,
    this.depth = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final hasReplies =
        comment.kids != null && comment.kids!.isNotEmpty;

    return Container(
      margin: EdgeInsets.only(
        left: depth * 14,
        top: 8,
        right: 8,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.orange.shade300,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${comment.by} • ${timeAgo(comment.time)}',
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            parseHtml(comment.text),
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
            ),
          ),

          if (hasReplies)
            Consumer(
              builder: (context, ref, child) {
                final repliesAsync =
                    ref.watch(
                  commentsProvider(comment.kids!),
                );

                return repliesAsync.when(
                  data: (replies) {
                    return Column(
                      children: replies.map((reply) {
                        return CommentWidget(
                          comment: reply,
                          depth: depth + 1,
                        );
                      }).toList(),
                    );
                  },

                  loading: () {
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  },

                  error: (_, __) {
                    return const SizedBox();
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}