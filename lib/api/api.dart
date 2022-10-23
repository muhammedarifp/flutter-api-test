import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:judhgf/test_mod/result.dart';
import 'package:judhgf/test_mod/test_mod.dart';

ValueNotifier<List<Result>?> ResultNotifire = ValueNotifier([]);

Future<TestMod?> getAllData() async {
  final resp = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=f9ec059d62092cb344d38fba579ce70f&language=en-US&page=1'));
  if (resp.body == null) {
    return null;
  } else {
    print(resp.runtimeType);
    final jsonResp = jsonDecode(resp.body);
    print(jsonResp.runtimeType);
    final data = await TestMod.fromJson(jsonResp);
    print(data.results![1].id);
    if (data.results != null) {
      ResultNotifire.value!.addAll(data.results!);
    }
    var jj = data.results;
    return data;
  }
}
