import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data_model.dart';

class DataProvider with ChangeNotifier {
  List<DataModel> _data = [];

  List<DataModel> get data => _data;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.56.1:5000/data'));

    if (response.statusCode == 200) {
      final List<dynamic> dataJson = json.decode(response.body);
      _data = dataJson.map((json) => DataModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
