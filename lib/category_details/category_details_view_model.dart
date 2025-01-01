import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';
import 'package:news/home/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  late ApiManager apiManager;

  List<Source>? sourceList;
  String? errorMessage;
  void getSourceByCategory(String categoryId) async {
    sourceList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await apiManager.getSources(categoryId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sourceList = response.sources;
      }
    } catch (e) {
      errorMessage = 'Error loading source list';
    }
    notifyListeners();
  }
}
