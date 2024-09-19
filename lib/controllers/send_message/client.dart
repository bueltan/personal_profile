// import 'dart:convert';

// import 'package:hasura_connect/hasura_connect.dart';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;

// Future<String> loadAsset() async {
//   return await rootBundle.loadString('assets/clave.key');
// }

// class TokenInterceptor extends InterceptorBase {

//   @override
//   Future<Request> onRequest(Request request) async {
//       String token = await loadAsset();
//         request.headers["Authorization"] = "Bearer $token";
     
//     return request;
//   }

//     @override
//   Future onError(HasuraError error) async {
//     if (!error.message.contains("|\$")) {
//       print("HasuraError ${error.message}\n"
//           "content request: ${error.request.query}\n "
//           "varibles: ${error.request.query.variables}\n"
//           "${error.request.query.document}");
//     }

//     return error;
//   }

// }

// class GraphQLClientHttp {
//   HasuraConnect connect = HasuraConnect(
//     "https://app.guazuapp.com/graphql",
//     interceptors: [TokenInterceptor()],
//   );
// }
