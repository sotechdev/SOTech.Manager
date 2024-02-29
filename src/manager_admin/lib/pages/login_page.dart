import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manager_admin/models/login_chat_request.dart';
import 'package:manager_admin/models/user.dart';
import 'package:manager_admin/services/chat_service.dart';
import 'package:manager_admin/services/user_service.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ChatService chatService = ChatService();
  final UserService userService = UserService();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();

  bool get formIsValid {
    return nameTextController.text.isNotEmpty &&
        emailTextController.text.isNotEmpty;
  }

  Future<void> _login() async {
    if (!formIsValid) return;
    final request = LoginChatRequest(
      id: const Uuid().v4(),
      name: nameTextController.text,
      email: emailTextController.text,
    );
    await chatService.login(request);
    userService.setUser(User(
      id: request.id,
      name: request.name,
      email: request.email,
    ));
    Modular.to.navigate('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autenticação'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameTextController,
            decoration: const InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: emailTextController,
            decoration: const InputDecoration(labelText: 'E-Mail'),
          ),
          FilledButton.icon(
            onPressed: _login,
            icon: const Icon(Icons.login),
            label: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
