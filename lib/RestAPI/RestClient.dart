import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/Screen/ProductCreateScreen.dart';
import 'package:rest_api/style/style.dart';

Future<bool> ProductCretateRequest (FormValues) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");

  var PostBody = json.encode(FormValues);
  var PostHeader = {
    "Content-Type": "application/json"
  };

  var response = await  http.post(URL, headers: PostHeader,body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if(ResultCode==200 && ResultBody['status']=="success" ) {
    SuccessTost("Request Succes");
    return true;
  }
  else {
    ErrorTost("Request fail : try again");
    return false ;
  }
}