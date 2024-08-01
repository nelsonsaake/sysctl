// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dyno.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dyno _$DynoFromJson(Map<String, dynamic> json) {
  return _Dyno.fromJson(json);
}

/// @nodoc
mixin _$Dyno {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get workingDirectory => throw _privateConstructorUsedError;
  String get exec => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DynoCopyWith<Dyno> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DynoCopyWith<$Res> {
  factory $DynoCopyWith(Dyno value, $Res Function(Dyno) then) =
      _$DynoCopyWithImpl<$Res, Dyno>;
  @useResult
  $Res call({int? id, String name, String workingDirectory, String exec});
}

/// @nodoc
class _$DynoCopyWithImpl<$Res, $Val extends Dyno>
    implements $DynoCopyWith<$Res> {
  _$DynoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? workingDirectory = null,
    Object? exec = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workingDirectory: null == workingDirectory
          ? _value.workingDirectory
          : workingDirectory // ignore: cast_nullable_to_non_nullable
              as String,
      exec: null == exec
          ? _value.exec
          : exec // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DynoImplCopyWith<$Res> implements $DynoCopyWith<$Res> {
  factory _$$DynoImplCopyWith(
          _$DynoImpl value, $Res Function(_$DynoImpl) then) =
      __$$DynoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name, String workingDirectory, String exec});
}

/// @nodoc
class __$$DynoImplCopyWithImpl<$Res>
    extends _$DynoCopyWithImpl<$Res, _$DynoImpl>
    implements _$$DynoImplCopyWith<$Res> {
  __$$DynoImplCopyWithImpl(_$DynoImpl _value, $Res Function(_$DynoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? workingDirectory = null,
    Object? exec = null,
  }) {
    return _then(_$DynoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workingDirectory: null == workingDirectory
          ? _value.workingDirectory
          : workingDirectory // ignore: cast_nullable_to_non_nullable
              as String,
      exec: null == exec
          ? _value.exec
          : exec // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DynoImpl with DiagnosticableTreeMixin implements _Dyno {
  _$DynoImpl(
      {required this.id,
      required this.name,
      required this.workingDirectory,
      required this.exec});

  factory _$DynoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DynoImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String workingDirectory;
  @override
  final String exec;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dyno(id: $id, name: $name, workingDirectory: $workingDirectory, exec: $exec)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dyno'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('workingDirectory', workingDirectory))
      ..add(DiagnosticsProperty('exec', exec));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DynoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workingDirectory, workingDirectory) ||
                other.workingDirectory == workingDirectory) &&
            (identical(other.exec, exec) || other.exec == exec));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, workingDirectory, exec);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DynoImplCopyWith<_$DynoImpl> get copyWith =>
      __$$DynoImplCopyWithImpl<_$DynoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DynoImplToJson(
      this,
    );
  }
}

abstract class _Dyno implements Dyno {
  factory _Dyno(
      {required final int? id,
      required final String name,
      required final String workingDirectory,
      required final String exec}) = _$DynoImpl;

  factory _Dyno.fromJson(Map<String, dynamic> json) = _$DynoImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get workingDirectory;
  @override
  String get exec;
  @override
  @JsonKey(ignore: true)
  _$$DynoImplCopyWith<_$DynoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
