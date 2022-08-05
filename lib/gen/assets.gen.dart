/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/AvenirLTProBook.otf
  String get avenirLTProBook => 'assets/fonts/AvenirLTProBook.otf';

  /// File path: assets/fonts/AvenirLTProHeavy.otf
  String get avenirLTProHeavy => 'assets/fonts/AvenirLTProHeavy.otf';

  /// File path: assets/fonts/AvenirLTProLight.otf
  String get avenirLTProLight => 'assets/fonts/AvenirLTProLight.otf';

  /// File path: assets/fonts/AvenirLTProMedium.otf
  String get avenirLTProMedium => 'assets/fonts/AvenirLTProMedium.otf';

  /// File path: assets/fonts/AvenirLTProRoman.otf
  String get avenirLTProRoman => 'assets/fonts/AvenirLTProRoman.otf';

  /// File path: assets/fonts/avenir_bold.otf
  String get avenirBold => 'assets/fonts/avenir_bold.otf';

  /// File path: assets/fonts/avenir_regular.otf
  String get avenirRegular => 'assets/fonts/avenir_regular.otf';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/splash_bg.png
  AssetGenImage get splashBg =>
      const AssetGenImage('assets/images/splash_bg.png');
}

class Assets {
  Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

  String get path => _assetName;

  String get keyName => _assetName;
}
