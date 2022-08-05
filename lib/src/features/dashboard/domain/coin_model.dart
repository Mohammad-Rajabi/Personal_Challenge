
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_model.freezed.dart';
part 'coin_model.g.dart';

@freezed
class CoinModel with _$CoinModel{

  factory CoinModel({
    String? id,
    String? symbol,
    String? name,
    String? image,
    @JsonKey(name: 'current_price') double? currentPrice,
    @JsonKey(name: 'high_24h') double? high24H,
    @JsonKey(name: 'low_24h') double? low24H,
    @JsonKey(name: 'price_change_24h') double? priceChange24H,
    @JsonKey(name: 'price_change_percentage_24h') double? priceChangePercentage24H,
  })=_CoinModel;

  factory CoinModel.fromJson(Map<String,dynamic> json)=>_$CoinModelFromJson(json);
}
