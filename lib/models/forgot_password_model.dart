class ForgottPasswordModel {
  String? detail;

  ForgottPasswordModel({this.detail});

  ForgottPasswordModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;
    return data;
  }
}
