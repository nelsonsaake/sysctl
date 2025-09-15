import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dyno.dart';

const String _dynosDir = "assets/resources/dynos";

Future<List<Dyno>> loadDynoAssets() async {
  final res = <Dyno>[];

  final files = [
    // "adorngirlies-server.json",
    // "adorngirlies-web.json",
    // "mtt-web-actions.json",
    // "semper-server.json",
    // "ws-backend.json",
    // "ws-web.json",
  ];

  for (final file in files) {
    final path = "$_dynosDir/$file";
    try {
      final contents = await rootBundle.loadString(path);
      final json = jsonDecode(contents);
      if (json is Map<String, dynamic>) {
        final dyno = Dyno.fromJson(json);
        res.add(dyno);
      }
    } catch (e) {
      print("Error loading $path: $e");
    }
  }

  return res;
}
