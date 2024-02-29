import 'package:logger/logger.dart';
import 'package:manager_admin/core/constants.dart';
import 'package:manager_admin/models/login_chat_request.dart';
import 'package:signalr_core/signalr_core.dart';

class ChatService {
  static final ChatService _instance = ChatService._();
  final logger = Logger();

  ChatService._();

  HubConnection? connection;

  factory ChatService() {
    _instance.connection ??= _getConnection(chatServerUrl);
    if (_instance.connection?.state == HubConnectionState.disconnected) {
      _instance.connection?.start();
    }
    return _instance;
  }

  static HubConnection _getConnection(String url) {
    return HubConnectionBuilder().withUrl(url).build();
  }

  Future<dynamic> invoke(String methodName, {List<dynamic>? args}) async {
    if (connection!.state == HubConnectionState.disconnected) {
      await connection?.start();
    }
    await connection!.invoke(methodName, args: args);
  }

  Future<void> login(LoginChatRequest loginChatRequest) async {
    try {
      invoke(
        'RequestLogin',
        args: [
          loginChatRequest.toMap(),
        ],
      );
    } catch (e) {
      logger.e("Erro ao autenticar no webservice", error: e);
    }
  }
}
