import 'send_service.dart';
import 'package:uuid/uuid.dart';

class SentMessageController {
  SendMessageService service = SendMessageService();
  Uuid uui = const Uuid();
  Future<bool> sendMessage(String message) async {
    try {
      Map<String, dynamic> bodyTicket = {
        'id_subscription': "U3Vic2NyaXB0aW9uTm9kZTo0NDI=",
        'node4': ".denisbueltan",
      };

      Map<String, dynamic> bodyMessage = {
        'id_bubble': uui.v1(),
        'type': "text",
        'text': message,
      };

      final bodyVariables = {
        ...bodyTicket,
        ...bodyMessage,
      };

      await service.sentMessage(bodyVariables);
    } on SentMessageException catch (e) {
      print(e);
      return false;
    }

    return true;
  }
}
