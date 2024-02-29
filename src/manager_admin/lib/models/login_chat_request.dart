import 'dart:convert';

class LoginChatRequest {
  final String id;
  final String name;
  final String email;

  LoginChatRequest({
    required this.id,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Email'] = email;
    return data;
  }

  String toJson() => jsonEncode(toMap());
}
