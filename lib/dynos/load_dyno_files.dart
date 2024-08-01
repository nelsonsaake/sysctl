import 'dart:convert';
import 'dart:io';

import 'dyno.dart';

const String _dynosDir =
    r"C:\Users\user\Desktop\projects\1000 lines\devpanel\assets\resources\dynos";

Future<List<Dyno>> loadDynoFiles() async {
  final dir = Directory(_dynosDir);
  final res = <Dyno>[];

  if (!await dir.exists()) {
    return [];
  }

  for (final entry in dir.listSync()) {
    // Check if the entity is a file
    if (entry is File) {
      // Check if the file has a .json extension
      if (entry.path.endsWith('.json')) {
        // Read the JSON file
        final contents = await entry.readAsString();
        final json = jsonDecode(contents);
        if (json is Map<String, dynamic>) {
          final dyno = Dyno.fromJson(json);
          res.add(dyno);
        }
      }
    }
  }

  return res;
}
