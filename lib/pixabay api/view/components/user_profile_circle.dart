import 'package:flutter/material.dart';

class UserProfileCircle extends StatelessWidget {
  const UserProfileCircle({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF833AB4), // Purple
            Color(0xFFFD1D1D), // Red
            Color(0xFFFCB045), // Orange
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),

        //  USER PROFILE IMAGE
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: url.isNotEmpty
              ? NetworkImage(url)
              : const AssetImage('assets/images/user.png'),
        ),
      ),
    );
  }
}
