import 'dart:convert';
import 'dart:developer';

import 'package:advance_flutter_ch2/api%20call%20example/modal/user_modal.dart';
import 'package:advance_flutter_ch2/helper/api_helper.dart';
import 'package:flutter/material.dart';

class UserApiProvider extends ChangeNotifier{

  List<User> userList = [];

  //FETCH API DATA USING API HELPER CLASS
  Future<void> fetchUserApiRecords() async {
    ApiHelper apiHelper = ApiHelper();
    try {
      String response = await apiHelper.callApi('https://jsonplaceholder.typicode.com/users');
      if (response.isNotEmpty){
        List<dynamic> jsonData = jsonDecode(response);
        userList = jsonData.map((e) => User.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching API records: $e...");
    }
  }

  UserApiProvider(){
    _init();
  }

  void _init(){
    fetchUserApiRecords();
  }
}