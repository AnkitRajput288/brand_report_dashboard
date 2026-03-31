// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metric_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetricModel _$MetricModelFromJson(Map<String, dynamic> json) {
  return _MetricModel.fromJson(json);
}

/// @nodoc
mixin _$MetricModel {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Positive = improvement, negative = decline (percentage points)
  double get changePct => throw _privateConstructorUsedError;

  /// Serializes this MetricModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetricModelCopyWith<MetricModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricModelCopyWith<$Res> {
  factory $MetricModelCopyWith(
          MetricModel value, $Res Function(MetricModel) then) =
      _$MetricModelCopyWithImpl<$Res, MetricModel>;
  @useResult
  $Res call({String label, double value, double changePct});
}

/// @nodoc
class _$MetricModelCopyWithImpl<$Res, $Val extends MetricModel>
    implements $MetricModelCopyWith<$Res> {
  _$MetricModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? changePct = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      changePct: null == changePct
          ? _value.changePct
          : changePct // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetricModelImplCopyWith<$Res>
    implements $MetricModelCopyWith<$Res> {
  factory _$$MetricModelImplCopyWith(
          _$MetricModelImpl value, $Res Function(_$MetricModelImpl) then) =
      __$$MetricModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value, double changePct});
}

/// @nodoc
class __$$MetricModelImplCopyWithImpl<$Res>
    extends _$MetricModelCopyWithImpl<$Res, _$MetricModelImpl>
    implements _$$MetricModelImplCopyWith<$Res> {
  __$$MetricModelImplCopyWithImpl(
      _$MetricModelImpl _value, $Res Function(_$MetricModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? changePct = null,
  }) {
    return _then(_$MetricModelImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      changePct: null == changePct
          ? _value.changePct
          : changePct // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricModelImpl extends _MetricModel {
  const _$MetricModelImpl(
      {required this.label, required this.value, required this.changePct})
      : super._();

  factory _$MetricModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricModelImplFromJson(json);

  @override
  final String label;
  @override
  final double value;

  /// Positive = improvement, negative = decline (percentage points)
  @override
  final double changePct;

  @override
  String toString() {
    return 'MetricModel(label: $label, value: $value, changePct: $changePct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.changePct, changePct) ||
                other.changePct == changePct));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, changePct);

  /// Create a copy of MetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricModelImplCopyWith<_$MetricModelImpl> get copyWith =>
      __$$MetricModelImplCopyWithImpl<_$MetricModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricModelImplToJson(
      this,
    );
  }
}

abstract class _MetricModel extends MetricModel {
  const factory _MetricModel(
      {required final String label,
      required final double value,
      required final double changePct}) = _$MetricModelImpl;
  const _MetricModel._() : super._();

  factory _MetricModel.fromJson(Map<String, dynamic> json) =
      _$MetricModelImpl.fromJson;

  @override
  String get label;
  @override
  double get value;

  /// Positive = improvement, negative = decline (percentage points)
  @override
  double get changePct;

  /// Create a copy of MetricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetricModelImplCopyWith<_$MetricModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
