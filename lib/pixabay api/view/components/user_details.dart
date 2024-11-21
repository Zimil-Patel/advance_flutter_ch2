import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/components/user_profile_circle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.id,
    required this.url,
    required this.name,
  });

  final int id;
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "id: $id",
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey),
            ),
          ],
        ),

        const Spacer(),
        const Icon(Icons.more_horiz_rounded),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
