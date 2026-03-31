// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brand_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BrandReport _$BrandReportFromJson(Map<String, dynamic> json) {
  return _BrandReport.fromJson(json);
}

/// @nodoc
mixin _$BrandReport {
  int get brandHealthScore => throw _privateConstructorUsedError;
  List<ZoneModel> get zones => throw _privateConstructorUsedError;

  /// 8-week spend values in Rs
  List<double> get weeklySpend => throw _privateConstructorUsedError;

  /// 8-week ROAS values
  List<double> get weeklyRoas => throw _privateConstructorUsedError;
  List<InsightModel> get insights => throw _privateConstructorUsedError;
  ChannelMixModel get channelMix => throw _privateConstructorUsedError;

  /// Serializes this BrandReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BrandReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BrandReportCopyWith<BrandReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandReportCopyWith<$Res> {
  factory $BrandReportCopyWith(
          BrandReport value, $Res Function(BrandReport) then) =
      _$BrandReportCopyWithImpl<$Res, BrandReport>;
  @useResult
  $Res call(
      {int brandHealthScore,
      List<ZoneModel> zones,
      List<double> weeklySpend,
      List<double> weeklyRoas,
      List<InsightModel> insights,
      ChannelMixModel channelMix});

  $ChannelMixModelCopyWith<$Res> get channelMix;
}

/// @nodoc
class _$BrandReportCopyWithImpl<$Res, $Val extends BrandReport>
    implements $BrandReportCopyWith<$Res> {
  _$BrandReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BrandReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandHealthScore = null,
    Object? zones = null,
    Object? weeklySpend = null,
    Object? weeklyRoas = null,
    Object? insights = null,
    Object? channelMix = null,
  }) {
    return _then(_value.copyWith(
      brandHealthScore: null == brandHealthScore
          ? _value.brandHealthScore
          : brandHealthScore // ignore: cast_nullable_to_non_nullable
              as int,
      zones: null == zones
          ? _value.zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<ZoneModel>,
      weeklySpend: null == weeklySpend
          ? _value.weeklySpend
          : weeklySpend // ignore: cast_nullable_to_non_nullable
              as List<double>,
      weeklyRoas: null == weeklyRoas
          ? _value.weeklyRoas
          : weeklyRoas // ignore: cast_nullable_to_non_nullable
              as List<double>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InsightModel>,
      channelMix: null == channelMix
          ? _value.channelMix
          : channelMix // ignore: cast_nullable_to_non_nullable
              as ChannelMixModel,
    ) as $Val);
  }

  /// Create a copy of BrandReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChannelMixModelCopyWith<$Res> get channelMix {
    return $ChannelMixModelCopyWith<$Res>(_value.channelMix, (value) {
      return _then(_value.copyWith(channelMix: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BrandReportImplCopyWith<$Res>
    implements $BrandReportCopyWith<$Res> {
  factory _$$BrandReportImplCopyWith(
          _$BrandReportImpl value, $Res Function(_$BrandReportImpl) then) =
      __$$BrandReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int brandHealthScore,
      List<ZoneModel> zones,
      List<double> weeklySpend,
      List<double> weeklyRoas,
      List<InsightModel> insights,
      ChannelMixModel channelMix});

  @override
  $ChannelMixModelCopyWith<$Res> get channelMix;
}

/// @nodoc
class __$$BrandReportImplCopyWithImpl<$Res>
    extends _$BrandReportCopyWithImpl<$Res, _$BrandReportImpl>
    implements _$$BrandReportImplCopyWith<$Res> {
  __$$BrandReportImplCopyWithImpl(
      _$BrandReportImpl _value, $Res Function(_$BrandReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of BrandReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandHealthScore = null,
    Object? zones = null,
    Object? weeklySpend = null,
    Object? weeklyRoas = null,
    Object? insights = null,
    Object? channelMix = null,
  }) {
    return _then(_$BrandReportImpl(
      brandHealthScore: null == brandHealthScore
          ? _value.brandHealthScore
          : brandHealthScore // ignore: cast_nullable_to_non_nullable
              as int,
      zones: null == zones
          ? _value._zones
          : zones // ignore: cast_nullable_to_non_nullable
              as List<ZoneModel>,
      weeklySpend: null == weeklySpend
          ? _value._weeklySpend
          : weeklySpend // ignore: cast_nullable_to_non_nullable
              as List<double>,
      weeklyRoas: null == weeklyRoas
          ? _value._weeklyRoas
          : weeklyRoas // ignore: cast_nullable_to_non_nullable
              as List<double>,
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<InsightModel>,
      channelMix: null == channelMix
          ? _value.channelMix
          : channelMix // ignore: cast_nullable_to_non_nullable
              as ChannelMixModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BrandReportImpl extends _BrandReport {
  const _$BrandReportImpl(
      {required this.brandHealthScore,
      required final List<ZoneModel> zones,
      required final List<double> weeklySpend,
      required final List<double> weeklyRoas,
      required final List<InsightModel> insights,
      required this.channelMix})
      : _zones = zones,
        _weeklySpend = weeklySpend,
        _weeklyRoas = weeklyRoas,
        _insights = insights,
        super._();

  factory _$BrandReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$BrandReportImplFromJson(json);

  @override
  final int brandHealthScore;
  final List<ZoneModel> _zones;
  @override
  List<ZoneModel> get zones {
    if (_zones is EqualUnmodifiableListView) return _zones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_zones);
  }

  /// 8-week spend values in Rs
  final List<double> _weeklySpend;

  /// 8-week spend values in Rs
  @override
  List<double> get weeklySpend {
    if (_weeklySpend is EqualUnmodifiableListView) return _weeklySpend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklySpend);
  }

  /// 8-week ROAS values
  final List<double> _weeklyRoas;

  /// 8-week ROAS values
  @override
  List<double> get weeklyRoas {
    if (_weeklyRoas is EqualUnmodifiableListView) return _weeklyRoas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyRoas);
  }

  final List<InsightModel> _insights;
  @override
  List<InsightModel> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  @override
  final ChannelMixModel channelMix;

  @override
  String toString() {
    return 'BrandReport(brandHealthScore: $brandHealthScore, zones: $zones, weeklySpend: $weeklySpend, weeklyRoas: $weeklyRoas, insights: $insights, channelMix: $channelMix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandReportImpl &&
            (identical(other.brandHealthScore, brandHealthScore) ||
                other.brandHealthScore == brandHealthScore) &&
            const DeepCollectionEquality().equals(other._zones, _zones) &&
            const DeepCollectionEquality()
                .equals(other._weeklySpend, _weeklySpend) &&
            const DeepCollectionEquality()
                .equals(other._weeklyRoas, _weeklyRoas) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.channelMix, channelMix) ||
                other.channelMix == channelMix));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      brandHealthScore,
      const DeepCollectionEquality().hash(_zones),
      const DeepCollectionEquality().hash(_weeklySpend),
      const DeepCollectionEquality().hash(_weeklyRoas),
      const DeepCollectionEquality().hash(_insights),
      channelMix);

  /// Create a copy of BrandReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandReportImplCopyWith<_$BrandReportImpl> get copyWith =>
      __$$BrandReportImplCopyWithImpl<_$BrandReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BrandReportImplToJson(
      this,
    );
  }
}

abstract class _BrandReport extends BrandReport {
  const factory _BrandReport(
      {required final int brandHealthScore,
      required final List<ZoneModel> zones,
      required final List<double> weeklySpend,
      required final List<double> weeklyRoas,
      required final List<InsightModel> insights,
      required final ChannelMixModel channelMix}) = _$BrandReportImpl;
  const _BrandReport._() : super._();

  factory _BrandReport.fromJson(Map<String, dynamic> json) =
      _$BrandReportImpl.fromJson;

  @override
  int get brandHealthScore;
  @override
  List<ZoneModel> get zones;

  /// 8-week spend values in Rs
  @override
  List<double> get weeklySpend;

  /// 8-week ROAS values
  @override
  List<double> get weeklyRoas;
  @override
  List<InsightModel> get insights;
  @override
  ChannelMixModel get channelMix;

  /// Create a copy of BrandReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BrandReportImplCopyWith<_$BrandReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
