import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PixabayApiProvider>(
      builder: (context, provider, child) => CupertinoButton(
        onPressed: () {
          if (provider.showSearchField) {
            final search = provider.searchController.text;
            if (search.isNotEmpty) {
              provider.searchFor(search);
            }
          } else {
            provider.setShowSearchField(true);
          }
        },
        child: const Icon(
          Icons.search_rounded,
          color: Colors.black,
          size: 28,
        ),
      ),
    );
  }
}
