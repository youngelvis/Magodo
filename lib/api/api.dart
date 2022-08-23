import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://132.145.231.191/portal/mraLagosApp/api/";

  postData(data, apiUrl) async {
    var username = 'test';
    var password ='benard@1991';
    var fullUrl = _url + apiUrl;
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
   http.Response response = await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders(basicAuth),

   );

   try{
     if(response.statusCode== 200){
       return response;

     }else {
       return 'failed';
     }
   }catch(e){
     print(e);
     return 'failed';
   }

  }

  _setHeaders(auth) =>
      {
        "Accept": "application/json",
        "Authorization": '${auth}',

      };
}