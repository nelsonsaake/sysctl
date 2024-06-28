import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dyno.freezed.dart';
part 'dyno.g.dart';

@freezed
class Dyno with _$Dyno {
  factory Dyno({
    required String name,
    required String workingDirectory,
    required String exec,
  }) = _Dyno;

  factory Dyno.fromJson(Map<String, Object?> json) => _$DynoFromJson(json);
}
