import 'dart:convert';

import 'package:get/get.dart';
import 'package:pricewheel/consts/globals.dart';
import 'package:pricewheel/models/models.dart';
import 'package:pricewheel/services/urls.dart';
import 'package:http/http.dart' as http;

class DbService extends GetxService {
  static late DbService dbService;

  Future<DbService> init() async {
    dbService = Get.put(DbService());
    print("Db service initialized".toString());
    return this;
  }

  Future<void> getAllCarData() async {
    Uri uri = Uri.parse(AppUrls.BASE_URL + AppUrls.GET_ALL_DATA);
    try {
      http.Response response = await http.get(uri);
      print("Response: ${response.statusCode}".toString());

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        // Example: CarCompany
        carCompanies = (data['carCompany'] as List)
            .map((companyJson) => CarCompany.fromJson(companyJson))
            .toList();

        // Example: CarModel
        carModels = (data['carModel'] as List)
            .map((modelJson) => CarModel.fromJson(modelJson))
            .toList();

        // Example: CarVersion
        carVersions = (data['carVersion'] as List)
            .map((versionJson) => CarVersion.fromJson(versionJson))
            .toList();

        // Example: CarOption
        carOptions = (data['carOption'] as List)
            .map((optionJson) => CarOption.fromJson(optionJson))
            .toList();
        print(carCompanies.length.toString());
        print(carModels.length.toString());
        print(carVersions.length.toString());
        print(carOptions.length.toString());
      } else {
        Get.snackbar("Error", jsonDecode(response.body)["message"]);
      }
    } catch (e) {
      print(e.toString().toString());
    }
  }
}
