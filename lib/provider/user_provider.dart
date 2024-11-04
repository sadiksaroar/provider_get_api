import 'package:flutter/material.dart';
import 'package:provider_get_api/data_utlis/data_uts.dart';
import 'package:provider_get_api/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<user_model> _userList = [];

  List<user_model> get allUserList => _userList;
  bool isLoading = false;

  void fetcPost() async {
    isLoading = true;
    try {
      DataUts dataUts = DataUts();
      _userList = await dataUts.getData();
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
    notifyListeners();
  }
}
