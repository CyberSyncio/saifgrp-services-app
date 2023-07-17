// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ProfileUpdate {
  int? pk;
  String? username;
  String? email;
  String? first_name;
  String? last_name;
  ProfileUpdate({
    this.pk,
    this.username,
    this.email,
    this.first_name,
    this.last_name,
  });

  ProfileUpdate copyWith({
    int? pk,
    String? username,
    String? email,
    String? first_name,
    String? last_name,
  }) {
    return ProfileUpdate(
      pk: pk ?? this.pk,
      username: username ?? this.username,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pk': pk,
      'username': username,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
    };
  }

  factory ProfileUpdate.fromMap(Map<String, dynamic> map) {
    return ProfileUpdate(
      pk: map['pk'] != null ? map['pk'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileUpdate.fromJson(String source) =>
      ProfileUpdate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileUpdate(pk: $pk, username: $username, email: $email, first_name: $first_name, last_name: $last_name)';
  }

  @override
  bool operator ==(covariant ProfileUpdate other) {
    if (identical(this, other)) return true;

    return other.pk == pk &&
        other.username == username &&
        other.email == email &&
        other.first_name == first_name &&
        other.last_name == last_name;
  }

  @override
  int get hashCode {
    return pk.hashCode ^
        username.hashCode ^
        email.hashCode ^
        first_name.hashCode ^
        last_name.hashCode;
  }
}
