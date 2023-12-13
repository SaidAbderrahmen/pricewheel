import 'package:get/get.dart';
import 'package:pricewheel/consts/globals.dart';

class PriceController extends GetxController {
// indexes of options screen, infos screen and occasion screen

  RxString selectedCompany = "Selectionner une marque".obs;
  RxString selectedModel = "Selectionner un modèle".obs;
  RxString selectedYear = "Selectionner une année".obs;
  RxString selectedOccasion = "Occasion ou neuf".obs;
  RxString selectedMileage = "Selectionner un kilométrage".obs;
  RxString selectedAge = "Selectionner un âge".obs;
  RxString selectedAccident = "Selectionner une option".obs;
  RxString selectedEngine = "Selectionner une option".obs;
  double basePrice = 0;
  double optionsPrice = 0;
  double fullPrice = 0;
  String carFullName = "";
  String carImage = "";

  //list of options
  Map<String, bool> options = {
    "Selectionner une option": false,
  };
  List<String> companyList = [
    "Selectionner une marque",
  ];

  List<String> modelList = [
    "Selectionner un modèle",
  ];

  List<String> yearList = [
    "Selectionner une année",
  ];

  List<String> occasionList = [
    "Occasion ou neuf",
    "Neuf",
    "Occasion",
  ];
  //get model list based on selected company

  void getModelList() {
    modelList = [
      "Selectionner un modèle",
    ];
    for (var item in carModels) {
      if (item.carCompanyId ==
          carCompanies
              .firstWhere((element) => element.name == selectedCompany.value)
              .id) {
        modelList.add(item.name!);
      }
    }
    update();
  }

  //get year list based on selected model

  void getYearList() {
    yearList = [
      "Selectionner une année",
    ];
    for (var item in carVersions) {
      if (item.carModelId ==
          carModels
              .firstWhere((element) => element.name == selectedModel.value)
              .id) {
        yearList.add(item.year.toString());
      }
    }
    update();
  }

  //get price based on options

  void getOptionSPrice() {
    optionsPrice = 0;
    for (var item in options.entries) {
      if (item.value) {
        optionsPrice += double.parse(carOptions
            .firstWhere((element) => element.title == item.key)
            .price!);
      }
    }
  }

  void calculateFullPrice() {
    getBasePrice();
    getOptionSPrice();
    fullPrice = basePrice + optionsPrice;
    fullPrice -= mileagePrice[selectedMileage.value]!;
    fullPrice -= agePrice[selectedAge.value]!;
    if (selectedAccident.value == "Oui") {
      fullPrice -= 5000;
    }
    if (selectedEngine.value == "Oui") {
      fullPrice -= 5000;
    }
    carFullName =
        "${selectedCompany.value} ${selectedModel.value} ${selectedYear.value}";
   var  imagePath = carVersions
        .firstWhere((element) => element.year == selectedYear.value)
        .photo!;
    carImage = imagePath.split("/").last;
    carImage = "https://pricewheel.alwaysdata.net/storage/$carImage";
    update();

  }

  //map mileage to price

  Map<String, double> mileagePrice = {
    "Selectionner un kilométrage": 0,
    "0 - 30 000": 2000,
    "30 000 - 90 000": 4500,
    "90 000 - 180 000": 6000,
    "180 000 - 270 000": 9000,
    "270 000 - 360 000": 11500,
    "360 000 - 500 000": 15000,
  };

  //map age to price

  Map<String, double> agePrice = {
    "Selectionner un âge": 0,
    "0 - 4": 500,
    "4 - 8": 1500,
    "8 - 15": 2500,
    "15 - 25": 3500,
    "> 25": 4000,
  };

  //get option list based on selected year

  void getOptionList() {
    options.clear();
    for (var item in carOptions) {
      if (item.carVersionId ==
          carVersions
              .firstWhere((element) => element.year == selectedYear.value)
              .id) {
        options.addAll({item.title!: false});
      }
    }
    update();
  }

  //get price from selected car version

  void getBasePrice() {
    basePrice = 0;
    for (var item in carVersions) {
      if (item.year == selectedYear.value) {
        basePrice = double.parse(item.initialPrice!);
      }
    }
  }

  @override
  void onInit() {
    companyList.addAll(carCompanies.map((e) => e.name!));
    super.onInit();
  }
}
