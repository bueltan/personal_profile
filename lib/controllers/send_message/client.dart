import 'package:hasura_connect/hasura_connect.dart';

class TokenInterceptor extends InterceptorBase {

  @override
  Future<Request> onRequest(Request request) async {
    
      String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNjgzMzU4NjMzLCJuYmYiOjE2ODMzNTg2MzMsImp0aSI6ImU0M2E5ODk4LWQwMzQtNGI0Mi1hYTc1LTE1NzgwM2QyN2E1NSIsImlkZW50aXR5IjoiY29udGFjdEBlbWFpbC5jb20iLCJleHAiOjE3NDM4Mzg2MzMsInVzZXJfY2xhaW1zIjp7ImlkIjozMjgsImlkX25hbWUiOiIuY29udGFjdCJ9fQ.rHBj_VSOEPW5jGyIfVwcpAReN2nJ8z5RATZI2I4a4HY";
   
        request.headers["Authorization"] = "Bearer $token";
     
    return request;
  }

    @override
  Future onError(HasuraError error) async {
    if (!error.message.contains("|\$")) {
      print("HasuraError ${error.message}\n"
          "content request: ${error.request.query}\n "
          "varibles: ${error.request.query.variables}\n"
          "${error.request.query.document}");
    }

    return error;
  }

}

class GraphQLClientHttp {
  HasuraConnect connect = HasuraConnect(
    "https://app.guazuapp.com/graphql",
    interceptors: [TokenInterceptor()],
  );
}
