
import 'package:get/get.dart';
import 'package:pricewheel/models/models.dart';
import 'package:pricewheel/services/db_service.dart';

DbService dbService = Get.find();
List<CarCompany> carCompanies = [];
List<CarModel> carModels = [];
List<CarVersion> carVersions = [];
List<CarOption> carOptions = [];