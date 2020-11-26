

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'api_constants.dart';


class ApiClient{

 final Client _client;

 ApiClient( this._client);


 dynamic get(String path)async{

   final response = await _client.get(
      "${ApiConstants.Base_Url}$path?api_key=${ApiConstants.ApiKey}",
      headers: {
        'Content-Type':"application/json",
      }
    );

    if(response.statusCode == 200){
     return json.decode(response.body);
     
   }else{
    throw Exception(response.reasonPhrase);
   }
 }



}