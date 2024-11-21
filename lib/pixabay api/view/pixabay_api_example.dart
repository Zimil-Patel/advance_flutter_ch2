import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/user_details.dart';
import 'components/user_profile_circle.dart';

class PixabayApiExample extends StatelessWidget {
  const PixabayApiExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Pixabay',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xfff5f5f5),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.5),
      ),

      //BODY
      body: Consumer<PixabayApiProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemBuilder: (context, index) => Container(
            height: 380,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                // USER DETAILS
                UserDetails(
                  url: provider.hitList[index].userImageURL,
                  name: provider.hitList[index].user,
                  id: provider.hitList[index].userId,
                ),
              ],
            ),
          ),
          itemCount: provider.hitList.length,
        ),
      ),
    );
  }
}
