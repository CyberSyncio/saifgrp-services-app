class ServicesListModel {
  int? id;
  String? name;
  String? image;
  String? description;
  int? price;
  bool? isActive;

  ServicesListModel(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.isActive});

  ServicesListModel.fromJson(Map<String, dynamic> json) {
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
