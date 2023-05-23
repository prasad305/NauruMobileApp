import 'dart:convert';

import '../constant.dart';
import 'package:http/http.dart' as http;
class APIManager{

  Future<dynamic>  postRequest(url,data) async {

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data),
    );
    if(response.statusCode == 200){
      print("response");//Check Response is success
      print(response.body);//Check Response is success
      final body = response.body;
      return jsonDecode(body);
    }else{
      return null;
    }
  }

}