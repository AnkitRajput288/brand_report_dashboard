// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_mix_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChannelMixModel _$ChannelMixModelFromJson(Map<String, dynamic> json) {
  return _ChannelMixModel.fromJson(json);
}

/// @nodoc
mixin _$ChannelMixModel {
  Map<String, double> get segments => throw _privateConstructorUsedError;

  /// Serializes this ChannelMixModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChannelMixModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelMixModelCopyWith<ChannelMixModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelMixModelCopyWith<$Res> {
  factory $ChannelMixModelCopyWith(
          ChannelMixModel value, $Res Function(ChannelMixModel) then) =
      _$ChannelMixModelCopyWithImpl<$Res, ChannelMixModel>;
  @useResult
  $Res call({Map<String, double> segments});
}

/// @nodoc
class _$ChannelMixModelCopyWithImpl<$Res, $Val extends ChannelMixModel>
    implements $ChannelMixModelCopyWith<$Res> {
  _$ChannelMixModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelMixModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
  }) {
    return _then(_value.copyWith(
      segments: null == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelMixModelImplCopyWith<$Res>
    implements $ChannelMixModelCopyWith<$Res> {
  factory _$$ChannelMixModelImplCopyWith(_$ChannelMixModelImpl value,
          $Res Function(_$ChannelMixModelImpl) then) =
      __$$ChannelMixModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, double> segments});
}

/// @nodoc
class __$$ChannelMixModelImplCopyWithImpl<$Res>
    extends _$ChannelMixModelCopyWithImpl<$Res, _$ChannelMixModelImpl>
    implements _$$ChannelMixModelImplCopyWith<$Res> {
  __$$ChannelMixModelImplCopyWithImpl(
      _$ChannelMixModelImpl _value, $Res Function(_$ChannelMixModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelMixModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segments = null,
  }) {
    return _then(_$ChannelMixModelImpl(
      segments: null == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChannelMixModelImpl implements _ChannelMixModel {
  const _$ChannelMixModelImpl({required final Map<String, double> segments})
      : _segments = segments;

  factory _$ChannelMixModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChannelMixModelImplFromJson(json);

  final Map<String, double> _segments;
  @override
  Map<String, double> get segments {
    if (_segments is EqualUnmodifiableMapView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_segments);
  }

  @override
  String toString() {
    return 'ChannelMixModel(segments: $segments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelMixModelImpl &&
            const DeepCollectionEquality().equals(other._segments, _segments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_segments));

  /// Create a copy of ChannelMixModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelMixModelImplCopyWith<_$ChannelMixModelImpl> get copyWith =>
      __$$ChannelMixModelImplCopyWithImpl<_$ChannelMixModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChannelMixModelImplToJson(
      this,
    );
  }
}

abstract class _ChannelMixModel implements ChannelMixModel {
  const factory _ChannelMixModel(
      {required final Map<String, double> segments}) = _$ChannelMixModelImpl;

  factory _ChannelMixModel.fromJson(Map<String, dynamic> json) =
      _$ChannelMixModelImpl.fromJson;

  @override
  Map<String, double> get segments;

  /// Create a copy of ChannelMixModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelMixModelImplCopyWith<_$ChannelMixModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
