import 'package:advance_flutter_ch2/pixabay%20api/view/components/user_profile_circle.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.tags,
    required this.url,
    required this.name,
  });

  final String tags;
  final String url, name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // USER PROFILE CIRCLE
        UserProfileCircle(url: url),

        const SizedBox(
          width: 10,
        ),

        // USER NAME AND ID
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                "Tags: $tags",
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey),
              ),
            ],
          ),
        ),

        const SizedBox(
          width: 10,
        ),

        const Icon(Icons.more_horiz_rounded),

        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
