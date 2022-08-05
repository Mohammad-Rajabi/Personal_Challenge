
import 'package:finnogate_challenge/src/features/dashboard/domain/coin_model.dart';

abstract class CoinsDataSource {
  Future<List<CoinModel>> getCoins({required int page, required int perPage});
}