import 'package:denis_profile/controllers/page_controller.dart';
import 'package:get/get.dart';
import 'send_service.dart';
import 'package:uuid/uuid.dart';

class SentMessageController {
  SendMessageService service = SendMessageService();
  Uuid uui = const Uuid();
  PageStateController pageStateController = Get.find<PageStateController>();
  Future<bool> sendMessage(String message) async {
    
    
    try {
      String ipv4 = pageStateController.ipv4??"nn";
      String hostname = pageStateController.hostname??"nn";

      Map<String, dynamic> bodyTicket = {
        'id_subscription': "U3Vic2NyaXB0aW9uTm9kZTo0NDI=",
        'node4': ".denisbueltan",
      };
      Map<String, dynamic> bodyMessage = {
        'id_bubble': uui.v1(),
        'type': "text",
        'text': "language: ${Get.locale.toString()}\n hostname: $hostname\n public ip: $ipv4\n$message",
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
