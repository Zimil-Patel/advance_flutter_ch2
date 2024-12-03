import 'dart:convert';
import 'dart:developer';

import 'package:advance_flutter_ch2/pixabay%20api/model/pixabay_model.dart';
import 'package:flutter/material.dart';

import '../../helper/api_helper.dart';

class PixabayApiProvider extends ChangeNotifier {
  List<PixabayModel> hitList = [];
  bool showSearchField = false;
  bool isLoading = true;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController(text: "");

  // toggle search field
  void setShowSearchField(bool value) {
    showSearchField = value;
    notifyListeners();
  }

  Future<void> searchFor(String search) async {
    isLoading = true;
    final url =
        'https://pixabay.com/api/?key=44442839-3febc9ca917a201f049adfeb6&q=$search&image_type=photo&orientation=horizontal';

    try {
      log("pixabay fetch called for $search---------------");
      String response = await ApiHelper.apiHelper.callApi(url);

      if (response.isNotEmpty) {
        final jsonData = jsonDecode(response);
        hitList = (jsonData['hits'] as List)
            .map((e) => PixabayModel.fromJson(e))
            .toList();
        isLoading = false;
        resestScroll();
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching API records: $e...");
    }
  }

  // Fetch api data
  Future<void> fetchPixabayRecords() async {
    isLoading = true;
    searchController.text = "";
    const url =
        'https://pixabay.com/api/?key=44442839-3febc9ca917a201f049adfeb6&image_type=photo&orientation=horizontal';

    try {
      log("pixabay fetch called ---------------");
      String response = await ApiHelper.apiHelper.callApi(url);
      if (response.isNotEmpty) {
        final jsonData = jsonDecode(response);
        hitList = (jsonData['hits'] as List)
            .map((e) => PixabayModel.fromJson(e))
            .toList();
        isLoading = false;
        resestScroll();
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching API records: $e...");
    }
  }

  // rest scroll
  void resestScroll() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
