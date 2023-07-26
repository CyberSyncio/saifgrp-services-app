class ComplaintModel {
  int? id;
  Service? service;
  Building? building;
  String? description;
  int? charge;
  String? createdOn;
  String? updatedOn;
  String? status;

  ComplaintModel(
      {this.id,
      this.service,
      this.building,
      this.description,
      this.charge,
      this.createdOn,
      this.updatedOn,
      this.status});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    building =
        json['building'] != null ? Building.fromJson(json['building']) : null;
    description = json['description'];
    charge = json['charge'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    if (building != null) {
      data['building'] = building!.toJson();
    }
    data['description'] = description;
    data['charge'] = charge;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['status'] = status;
    return data;
  }
}

class Service {
  int? id;
  String? name;
  String? image;
  String? description;
  int? price;
  bool? isActive;

  Service(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.isActive});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['is_active'] = isActive;
    return data;
  }
}

class Building {
  int? id;
  String? name;
  String? description;
  int? price;
  bool? isActive;

  Building({this.id, this.name, this.description, this.price, this.isActive});

  Building.fromJson(Map<String, dynamic> json) {
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
