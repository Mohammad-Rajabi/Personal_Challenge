import 'package:finnogate_challenge/src/constants/http_constant.dart';
import 'package:finnogate_challenge/src/features/dashboard/domain/coin_model.dart';
import 'package:finnogate_challenge/src/utils/http_client_service.dart';

import 'coins_data_source.dart';

class RemoteCoinsDataSource implements CoinsDataSource {
  HttpClientService _httpClientService;

  RemoteCoinsDataSource({required HttpClientService httpClientService})
      : _httpClientService = httpClientService;

  @override
  Future<List<CoinModel>> getCoins({required int page,required int perPage}) async {
    final dio = _httpClientService.getDio(kCoingeckoApiBaseUrl);
    Map<String, dynamic> queryParameters = {
      "vs_currency": "usd",
      "order": "market_cap_desc",
      "per_page": perPage,
      "page": page,
      "sparkline": "false"
    };
    List<CoinModel> coins = [];
    final response =
        await dio.get(kCoinsEndPoint, queryParameters: queryParameters);
    for(var json in (response.data as List)){
      coins.add(CoinModel.fromJson(json));
    }
    return coins;
  }
}
