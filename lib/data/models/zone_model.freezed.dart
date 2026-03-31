// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ZoneModel _$ZoneModelFromJson(Map<String, dynamic> json) {
  return _ZoneModel.fromJson(json);
}

/// @nodoc
mixin _$ZoneModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  MetricModel get primaryMetric => throw _privateConstructorUsedError;
  List<MetricModel> get metrics => throw _privateConstructorUsedError;

  /// 4 data points used for the sparkline chart
  List<double> get weeklyTrend => throw _privateConstructorUsedError;

  /// Serializes this ZoneModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ZoneModelCopyWith<ZoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoneModelCopyWith<$Res> {
  factory $ZoneModelCopyWith(ZoneModel value, $Res Function(ZoneModel) then) =
      _$ZoneModelCopyWithImpl<$Res, ZoneModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      MetricModel primaryMetric,
      List<MetricModel> metrics,
      List<double> weeklyTrend});

  $MetricModelCopyWith<$Res> get primaryMetric;
}

/// @nodoc
class _$ZoneModelCopyWithImpl<$Res, $Val extends ZoneModel>
    implements $ZoneModelCopyWith<$Res> {
  _$ZoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? primaryMetric = null,
    Object? metrics = null,
    Object? weeklyTrend = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      primaryMetric: null == primaryMetric
          ? _value.primaryMetric
          : primaryMetric // ignore: cast_nullable_to_non_nullable
              as MetricModel,
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<MetricModel>,
      weeklyTrend: null == weeklyTrend
          ? _value.weeklyTrend
          : weeklyTrend // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetricModelCopyWith<$Res> get primaryMetric {
    return $MetricModelCopyWith<$Res>(_value.primaryMetric, (value) {
      return _then(_value.copyWith(primaryMetric: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ZoneModelImplCopyWith<$Res>
    implements $ZoneModelCopyWith<$Res> {
  factory _$$ZoneModelImplCopyWith(
          _$ZoneModelImpl value, $Res Function(_$ZoneModelImpl) then) =
      __$$ZoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      MetricModel primaryMetric,
      List<MetricModel> metrics,
      List<double> weeklyTrend});

  @override
  $MetricModelCopyWith<$Res> get primaryMetric;
}

/// @nodoc
class __$$ZoneModelImplCopyWithImpl<$Res>
    extends _$ZoneModelCopyWithImpl<$Res, _$ZoneModelImpl>
    implements _$$ZoneModelImplCopyWith<$Res> {
  __$$ZoneModelImplCopyWithImpl(
      _$ZoneModelImpl _value, $Res Function(_$ZoneModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? primaryMetric = null,
    Object? metrics = null,
    Object? weeklyTrend = null,
  }) {
    return _then(_$ZoneModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      primaryMetric: null == primaryMetric
          ? _value.primaryMetric
          : primaryMetric // ignore: cast_nullable_to_non_nullable
              as MetricModel,
      metrics: null == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as List<MetricModel>,
      weeklyTrend: null == weeklyTrend
          ? _value._weeklyTrend
          : weeklyTrend // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZoneModelImpl implements _ZoneModel {
  const _$ZoneModelImpl(
      {required this.id,
      required this.name,
      required this.primaryMetric,
      required final List<MetricModel> metrics,
      required final List<double> weeklyTrend})
      : _metrics = metrics,
        _weeklyTrend = weeklyTrend;

  factory _$ZoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZoneModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final MetricModel primaryMetric;
  final List<MetricModel> _metrics;
  @override
  List<MetricModel> get metrics {
    if (_metrics is EqualUnmodifiableListView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metrics);
  }

  /// 4 data points used for the sparkline chart
  final List<double> _weeklyTrend;

  /// 4 data points used for the sparkline chart
  @override
  List<double> get weeklyTrend {
    if (_weeklyTrend is EqualUnmodifiableListView) return _weeklyTrend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyTrend);
  }

  @override
  String toString() {
    return 'ZoneModel(id: $id, name: $name, primaryMetric: $primaryMetric, metrics: $metrics, weeklyTrend: $weeklyTrend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoneModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.primaryMetric, primaryMetric) ||
                other.primaryMetric == primaryMetric) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality()
                .equals(other._weeklyTrend, _weeklyTrend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      primaryMetric,
      const DeepCollectionEquality().hash(_metrics),
      const DeepCollectionEquality().hash(_weeklyTrend));

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoneModelImplCopyWith<_$ZoneModelImpl> get copyWith =>
      __$$ZoneModelImplCopyWithImpl<_$ZoneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZoneModelImplToJson(
      this,
    );
  }
}

abstract class _ZoneModel implements ZoneModel {
  const factory _ZoneModel(
      {required final String id,
      required final String name,
      required final MetricModel primaryMetric,
      required final List<MetricModel> metrics,
      required final List<double> weeklyTrend}) = _$ZoneModelImpl;

  factory _ZoneModel.fromJson(Map<String, dynamic> json) =
      _$ZoneModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  MetricModel get primaryMetric;
  @override
  List<MetricModel> get metrics;

  /// 4 data points used for the sparkline chart
  @override
  List<double> get weeklyTrend;

  /// Create a copy of ZoneModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoneModelImplCopyWith<_$ZoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
