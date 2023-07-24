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
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    building = json['building'] != null
        ? new Building.fromJson(json['building'])
        : null;
    description = json['description'];
    charge = json['charge'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.building != null) {
      data['building'] = this.building!.toJson();
    }
    data['description'] = this.description;
    data['charge'] = this.charge;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['status'] = this.status;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['is_active'] = this.isActive;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['is_active'] = this.isActive;
    return data;
  }
}