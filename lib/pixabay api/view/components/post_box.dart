import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/components/bottom_list_tile.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/components/image_social_content.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/components/user_details.dart';
import 'package:flutter/material.dart';

class PostBox extends StatelessWidget {
  const PostBox({
    super.key,
    required this.provider,
    required this.index,
  });

  final PixabayApiProvider provider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          // USER DETAILS
          UserDetails(
            url: provider.hitList[index].userImageURL,
            name: provider.hitList[index].user,
            tags: provider.hitList[index].tags.toString(),
          ),

          // IMAGE AND SOCIAL CONTENT
          ImageSocialContent(provider: provider, index: index),

          // BOTTOM DETAILS (USER, ID, SHARE, CHECK MORE)
          BottomListTile(provider: provider, index: index),
        ],
      ),
    );
  }
}
