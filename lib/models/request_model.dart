class RequestCreateModel {
  int? id;
  int? service;
  int? building;
  String? description;
  int? charge;
  String? createdOn;
  String? updatedOn;
  String? status;

  RequestCreateModel(
      {this.id,
      this.service,
      this.building,
      this.description,
      this.charge,
      this.createdOn,
      this.updatedOn,
      this.status});

  RequestCreateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'];
    building = json['building'];
    description = json['description'];
    charge = json['charge'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service'] = service;
    data['building'] = building;
    data['description'] = description;
    data['charge'] = charge;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['status'] = status;
    return data;
  }
}
