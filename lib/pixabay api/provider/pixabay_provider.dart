import 'dart:convert';
import 'dart:developer';

import 'package:advance_flutter_ch2/pixabay%20api/model/pixabay_model.dart';
import 'package:flutter/material.dart';

import '../../helper/api_helper.dart';

class PixabayApiProvider extends ChangeNotifier{

  List<PixabayModel> hitList = [];

  Future<void> fetchPixabayRecords() async {

    try {
      log("pixabay fetch called ---------------");
      String response = await ApiHelper.apiHelper.callApi('https://pixabay.com/api/?key=44442839-3febc9ca917a201f049adfeb6');
      if (response.isNotEmpty){
        final jsonData = jsonDecode(response);
        hitList = (jsonData['hits'] as List).map((e) => PixabayModel.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching API records: $e...");
    }
  }


}