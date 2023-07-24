class BuildingModel {
  int? id;
  String? name;
  String? description;
  int? price;
  bool? isActive;

  BuildingModel(
      {this.id, this.name, this.description, this.price, this.isActive});

  BuildingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['is_active'] = isActive;
    return data;
  }
}

class ResidentListModel {
  int? id;
  String? name;
  String? description;
  int? price;
  bool? isActive;

  ResidentListModel(
      {this.id, this.name, this.description, this.price, this.isActive});

  ResidentListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['is_active'] = isActive;
    return data;
  }
}
