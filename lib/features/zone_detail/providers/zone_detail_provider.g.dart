// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zone_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$zoneDetailHash() => r'818546e56f0cc60a5c85182373ffff857f350c9c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Returns the [ZoneModel] with the given [zoneId], or null if not found.
/// Derived synchronously from the brand report data.
///
/// Copied from [zoneDetail].
@ProviderFor(zoneDetail)
const zoneDetailProvider = ZoneDetailFamily();

/// Returns the [ZoneModel] with the given [zoneId], or null if not found.
/// Derived synchronously from the brand report data.
///
/// Copied from [zoneDetail].
class ZoneDetailFamily extends Family<ZoneModel?> {
  /// Returns the [ZoneModel] with the given [zoneId], or null if not found.
  /// Derived synchronously from the brand report data.
  ///
  /// Copied from [zoneDetail].
  const ZoneDetailFamily();

  /// Returns the [ZoneModel] with the given [zoneId], or null if not found.
  /// Derived synchronously from the brand report data.
  ///
  /// Copied from [zoneDetail].
  ZoneDetailProvider call(
    String zoneId,
  ) {
    return ZoneDetailProvider(
      zoneId,
    );
  }

  @override
  ZoneDetailProvider getProviderOverride(
    covariant ZoneDetailProvider provider,
  ) {
    return call(
      provider.zoneId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'zoneDetailProvider';
}

/// Returns the [ZoneModel] with the given [zoneId], or null if not found.
/// Derived synchronously from the brand report data.
///
/// Copied from [zoneDetail].
class ZoneDetailProvider extends AutoDisposeProvider<ZoneModel?> {
  /// Returns the [ZoneModel] with the given [zoneId], or null if not found.
  /// Derived synchronously from the brand report data.
  ///
  /// Copied from [zoneDetail].
  ZoneDetailProvider(
    String zoneId,
  ) : this._internal(
          (ref) => zoneDetail(
            ref as ZoneDetailRef,
            zoneId,
          ),
          from: zoneDetailProvider,
          name: r'zoneDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$zoneDetailHash,
          dependencies: ZoneDetailFamily._dependencies,
          allTransitiveDependencies:
              ZoneDetailFamily._allTransitiveDependencies,
          zoneId: zoneId,
        );

  ZoneDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.zoneId,
  }) : super.internal();

  final String zoneId;

  @override
  Override overrideWith(
    ZoneModel? Function(ZoneDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ZoneDetailProvider._internal(
        (ref) => create(ref as ZoneDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        zoneId: zoneId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ZoneModel?> createElement() {
    return _ZoneDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ZoneDetailProvider && other.zoneId == zoneId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, zoneId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ZoneDetailRef on AutoDisposeProviderRef<ZoneModel?> {
  /// The parameter `zoneId` of this provider.
  String get zoneId;
}

class _ZoneDetailProviderElement extends AutoDisposeProviderElement<ZoneModel?>
    with ZoneDetailRef {
  _ZoneDetailProviderElement(super.provider);

  @override
  String get zoneId => (origin as ZoneDetailProvider).zoneId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
