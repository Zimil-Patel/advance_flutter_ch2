import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:flutter/material.dart';

class BottomListTile extends StatelessWidget {
  const BottomListTile({
    super.key,
    required this.provider,
    required this.index,
  });

  final PixabayApiProvider provider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          // User_id
          leading: Text(
            provider.hitList[index].user,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),

          // User_name
          title: Text(
            "${provider.hitList[index].userId.toString()} Check more about me",
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),

          // Share post icon
          trailing: Transform.rotate(
            angle: .8,
            child: const Icon(
              Icons.navigation_outlined,
            ),
          ),
        ),
        const Center(
          child: Icon(
            Icons.keyboard_arrow_down,
          ),
        ),
      ],
    );
  }
}
