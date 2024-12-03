import 'package:advance_flutter_ch2/pixabay%20api/provider/pixabay_provider.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/components/post_box.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/components/search_button.dart';
import 'package:advance_flutter_ch2/pixabay%20api/view/components/title_and_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PixabayApiExample extends StatelessWidget {
  const PixabayApiExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: false,
        title: const TitleAndSearchField(),
        actions: const [SearchButton()],
        backgroundColor: const Color(0xfff5f5f5),
        surfaceTintColor: const Color(0xfff5f5f5),
      ),

      //BODY
      body: Consumer<PixabayApiProvider>(builder: (context, provider, child) {
        if (!provider.isLoading && provider.hitList.isNotEmpty) {
          return ListView.builder(
            controller: provider.scrollController,
            itemBuilder: (context, index) => PostBox(
              provider: provider,
              index: index,
            ),
            itemCount: provider.hitList.length,
          );
        }

        return const Center(child: CupertinoActivityIndicator());
      }),
    );
  }
}
