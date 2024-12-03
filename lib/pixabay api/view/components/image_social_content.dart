import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:flutter/material.dart';

class ImageSocialContent extends StatelessWidget {
  const ImageSocialContent({
    super.key,
    required this.provider,
    required this.index,
  });

  final PixabayApiProvider provider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // IMAGE
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  provider.hitList[index].largeImageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // SOCIAL CONTENT
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // FAVOURITE
                    IconLable(
                      icon: Icons.favorite,
                      iconColor: Colors.red,
                      label: provider.hitList[index].likes.toString(),
                    ),

                    // COMMENTS
                    const SizedBox(width: 20),
                    IconLable(
                      icon: Icons.comment,
                      iconColor: Colors.blueAccent,
                      label: provider.hitList[index].comments.toString(),
                    ),

                    // DOWNLOADS
                    const SizedBox(width: 20),
                    IconLable(
                      icon: Icons.download_rounded,
                      iconColor: Colors.black,
                      label: provider.hitList[index].downloads.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconLable extends StatelessWidget {
  const IconLable(
      {super.key,
      required this.iconColor,
      required this.label,
      required this.icon});

  final Color iconColor;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        Text("  $label"),
      ],
    );
  }
}
