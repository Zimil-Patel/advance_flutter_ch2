import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/pixabay_provider.dart';

class TitleAndSearchField extends StatelessWidget {
  const TitleAndSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PixabayApiProvider>(
      builder: (context, provider, child) {
        return !provider.showSearchField
            ? CupertinoButton(
                padding: const EdgeInsets.only(left: 10),
                onPressed: () {
                  provider.fetchPixabayRecords();
                },
                child: Text(
                  'Pixabay',
                  style: GoogleFonts.pacifico(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                ),
              )
            : SizedBox(
                height: 60, // Ensure enough height for the Row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // CLOSE SEARCH FIELD BUTTON
                    CupertinoButton(
                      onPressed: () {
                        provider.searchController.text = "";
                        provider.setShowSearchField(false);
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      ),
                    ),

                    // SEARCH FIELD
                    Expanded(
                      child: TextFormField(
                        onEditingComplete: () {
                          if (provider.showSearchField) {
                            final search = provider.searchController.text;
                            if (search.isNotEmpty) {
                              provider.searchFor(search);
                            }
                          } else {
                            provider.setShowSearchField(true);
                          }
                        },
                        controller: provider.searchController,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2),
                          ),
                          hintText: 'Search...',
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
