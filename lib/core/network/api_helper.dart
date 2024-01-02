import 'dart:convert';
import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart'as https;


class ApiHelper {

  String baseUrl ="https://fakestoreapi.com/";


  Future get(url,Map<String,String>header) async {
    var response =await https.get(Uri.parse(baseUrl+url),headers: header);
    debugPrint("======= ${baseUrl+url} =========");
    log(response.body.toString());
    return jsonDecode(response.body.toString()) ;
  }

  Future delete(url,Map<String,String> header) async {
    var response =await https.get(Uri.parse(baseUrl+url),headers: header);
    return jsonDecode(response.body) ;
  }

  Future post(url,Map<String,String> header,body) async {
    var response =await https.post(Uri.parse(baseUrl+url),headers: header,body: body);
    return jsonDecode(response.body) ;
  }

  Future put(url,Map<String,String> header,body) async {
    var response =await https.put(Uri.parse(baseUrl+url),headers: header,body: body);
    return jsonDecode(response.body) ;
  }
}