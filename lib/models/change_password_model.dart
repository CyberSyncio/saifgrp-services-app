class PasswordChangeModel {
  String? detail;

  PasswordChangeModel({this.detail});

  PasswordChangeModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;
    return data;
  }
}
