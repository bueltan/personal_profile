// import 'client.dart';
// import 'document_mutation.dart';

// class SendMessageService  {
//   GraphQLClientHttp graphQLClient = GraphQLClientHttp();

//   Future<Map<String,dynamic>> sentMessage(Map<String, dynamic> bodyVariables) async {
//     var hasuraConnect = graphQLClient.connect;
//     final stopwatch = Stopwatch()..start();
//     Map<String, dynamic> ticketResponse;
//     try {
//       final response = await hasuraConnect.mutation(SendMessageDoc.sentMsg,
//           variables: bodyVariables).timeout(const Duration(hours: 1));
//       ticketResponse =
//           response['data']['CreateMessage']['ticket'];

//     } on Exception catch (error, trace) {
//       throw SentMessageException(
//           message: "error : $error \n,"
//               "sentMessage time lapse :"
//               " ${stopwatch.elapsed} \n"
//               " trace : $trace \n");
//     }
//     return ticketResponse;
//   }
// }

// class SentMessageException implements Exception {
//   final String message;
//   SentMessageException({this.message = 'Unknown error occurred. '});
// }
