// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinModel _$$_CoinModelFromJson(Map<String, dynamic> json) => _$_CoinModel(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      currentPrice: (json['current_price'] as num?)?.toDouble(),
      high24H: (json['high_24h'] as num?)?.toDouble(),
      low24H: (json['low_24h'] as num?)?.toDouble(),
      priceChange24H: (json['price_change_24h'] as num?)?.toDouble(),
      priceChangePercentage24H:
          (json['price_change_percentage_24h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CoinModelToJson(_$_CoinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'high_24h': instance.high24H,
      'low_24h': instance.low24H,
      'price_change_24h': instance.priceChange24H,
      'price_change_percentage_24h': instance.priceChangePercentage24H,
    };
