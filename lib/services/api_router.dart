import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class ApiRouter {

  static Future<Map<String,dynamic>?> get ({
    required Uri url,
    Map<String,dynamic>? parameters
  })async {
    try{
      var urlWithParameters = Uri.http(url.authority,url.path,parameters);
      Response response = await  http.get(
          urlWithParameters,
      );
      if(response.statusCode == 500){
        return  throw Exception('internal server error');
      }
      if(response.statusCode != 200){
        return  throw Exception(response.body);
      }

      Map<String,dynamic> data = jsonDecode(response.body);
      return data;
    }catch (ae){
      if (ae is! Exception) {
        return  throw Exception('Se ha caido la conexión');
      }

      rethrow;
    }
  }
}