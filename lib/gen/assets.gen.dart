/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifGen {
  const $AssetsGifGen();

  /// File path: assets/gif/loaderprimary.gif
  AssetGenImage get loaderprimary =>
      const AssetGenImage('assets/gif/loaderprimary.gif');

  /// File path: assets/gif/splashgf.gif
  AssetGenImage get splashgf => const AssetGenImage('assets/gif/splashgf.gif');

  /// File path: assets/gif/splashscreenimage.gif
  AssetGenImage get splashscreenimage =>
      const AssetGenImage('assets/gif/splashscreenimage.gif');

  /// List of all assets
  List<AssetGenImage> get values =>
      [loaderprimary, splashgf, splashscreenimage];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/attendaceicon.png
  AssetGenImage get attendaceicon =>
      const AssetGenImage('assets/images/attendaceicon.png');

  /// File path: assets/images/deliveryrobot.png
  AssetGenImage get deliveryrobot =>
      const AssetGenImage('assets/images/deliveryrobot.png');

  /// File path: assets/images/ekasyslogo1.png
  AssetGenImage get ekasyslogo1 =>
      const AssetGenImage('assets/images/ekasyslogo1.png');

  /// File path: assets/images/greenimage.jpg
  AssetGenImage get greenimage =>
      const AssetGenImage('assets/images/greenimage.jpg');

  /// File path: assets/images/locationicon.png
  AssetGenImage get locationicon =>
      const AssetGenImage('assets/images/locationicon.png');

  /// File path: assets/images/locationrooticon.png
  AssetGenImage get locationrooticon =>
      const AssetGenImage('assets/images/locationrooticon.png');

  /// File path: assets/images/newsaleicon.png
  AssetGenImage get newsaleicon =>
      const AssetGenImage('assets/images/newsaleicon.png');

  /// File path: assets/images/noimage.png
  AssetGenImage get noimage => const AssetGenImage('assets/images/noimage.png');

  /// File path: assets/images/paymenticon.png
  AssetGenImage get paymenticon =>
      const AssetGenImage('assets/images/paymenticon.png');

  /// File path: assets/images/shoppingiconsale.png
  AssetGenImage get shoppingiconsale =>
      const AssetGenImage('assets/images/shoppingiconsale.png');

  /// File path: assets/images/transactions.png
  AssetGenImage get transactions =>
      const AssetGenImage('assets/images/transactions.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        attendaceicon,
        deliveryrobot,
        ekasyslogo1,
        greenimage,
        locationicon,
        locationrooticon,
        newsaleicon,
        noimage,
        paymenticon,
        shoppingiconsale,
        transactions
      ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/attendencelottiejson.json
  String get attendencelottiejson => 'assets/lotties/attendencelottiejson.json';

  /// File path: assets/lotties/cutomerlottiejson.json
  String get cutomerlottiejson => 'assets/lotties/cutomerlottiejson.json';

  /// File path: assets/lotties/productlottiejson.json
  String get productlottiejson => 'assets/lotties/productlottiejson.json';

  /// File path: assets/lotties/salesorderlottiejson.json
  String get salesorderlottiejson => 'assets/lotties/salesorderlottiejson.json';

  /// File path: assets/lotties/successanimationlottie.json
  String get successanimationlottie =>
      'assets/lotties/successanimationlottie.json';

  /// File path: assets/lotties/transactionlottie.json
  String get transactionlottie => 'assets/lotties/transactionlottie.json';

  /// List of all assets
  List<String> get values => [
        attendencelottiejson,
        cutomerlottiejson,
        productlottiejson,
        salesorderlottiejson,
        successanimationlottie,
        transactionlottie
      ];
}

class Assets {
  Assets._();

  static const $AssetsGifGen gif = $AssetsGifGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
