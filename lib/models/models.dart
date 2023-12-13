class CarCompany {
  int? id;
  String? name;
  String? logo;

  CarCompany({
    this.id,
    this.name,
    this.logo,
  });

  CarCompany.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    logo = json["logo"] ?? "";
  }
}

class CarModel {
  int? id;
  String? name;
  int? carCompanyId;

  CarModel({
    this.id,
    this.name,
    this.carCompanyId,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    carCompanyId = json["car_company_id"];
  }
}

class CarVersion {
  int? id;
  String? year;
  int? carModelId;
  String? initialPrice;
   String? photo;

  CarVersion(
      {this.id,
      this.year,
      this.carModelId,
      this.initialPrice,
       this.photo
      });

  CarVersion.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    year = json["year"];
    carModelId = json["car_model_id"];
    initialPrice = json["initial_price"];
     photo = json["photo"] ?? "...";
  }
}

class CarOption {
  int? id;
  String? title;
  String? description;
  String? price;
  int? carVersionId;

  CarOption({
    this.id,
    this.title,
    this.description,
    this.price,
    this.carVersionId,
  });

  CarOption.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    price = json["price"];
    carVersionId = json["car_version_id"];
  }
}
