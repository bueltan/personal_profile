import 'package:http/http.dart' as http;

Future<bool> sendGoogleForm(
    String name, String email, String tel, String message) async {
  String formUrl =
      "https://docs.google.com/forms/u/0/d/e/1FAIpQLSftqGkBGI9t5pacNjP1ZEpx4qTA91C1jqPKeP1CfSTTmbkAHA/formResponse";

  Map<String, String> body = {
    'entry.1454721394': name,
    'entry.1458621759': email,
    'entry.1195818560': tel,
    'entry.561337667': message,
  };

  try {
    var response = await http.post(
      Uri.parse(formUrl),
      body: body,
    );
    if (response.statusCode == 404) {
      return true;
    }

    if (response.statusCode == 200) {
      return true;
    }
  } on http.ClientException catch (e) {
    print('ClientException: $e');
    return true;
  } catch (e, stacktrace) {
    print('Stacktrace: $stacktrace');
    return false;
  }
  return true;
}
